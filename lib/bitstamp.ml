let base_uri = "https://www.bitstamp.net/api/"
let mk_uri section = Uri.of_string @@ base_uri ^ section

module Credentials = struct
  type t = {
    id: string; key: string; secret: string;
  }

  let make ~id ~key ~secret = { id; key; secret; }

  module Signature = struct
    let make c =
      let nonce = Printf.sprintf "%.0f" (Unix.time ()) in
      let msg = Cstruct.of_string (nonce ^ c.id ^ c.key) in
      let key = Cstruct.of_string c.secret in
      let res =
        Nocrypto.Hash.(mac `SHA256 ~key msg)
        |> Cstruct.to_string
        |> Hex.of_string |> function `Hex s -> String.uppercase s
      in nonce, res
  end
end

module type HTTP_CLIENT = sig
  include Cohttp.S.IO

  val get : string -> (string * string) list ->
    (string -> [< `Error of string | `Ok of 'a ]) -> 'a t

  val post : Credentials.t -> string -> (string * string) list ->
    (string -> [< `Error of string | `Ok of 'a ]) -> 'a t
end

module type JSONABLE = sig
  type t
  val to_yojson : t -> Yojson.Safe.json
  val of_yojson : Yojson.Safe.json -> [`Ok of t | `Error of string]
end

module Stringable = struct
  module Of_jsonable (T: JSONABLE) = struct
    let to_string t = T.to_yojson t |> Yojson.Safe.to_string
    let pp ppf t = Format.fprintf ppf "%s" (to_string t)
    let of_string s = Yojson.Safe.from_string s |> T.of_yojson
    let ts_of_string s =
      let ts = Yojson.Safe.from_string s in
      try
        match ts with
        | `List ts ->
            begin
              try
                let ts = List.map
                    (fun t -> match T.of_yojson t with
                       | `Ok a -> a
                       | `Error s -> failwith s) ts
                in `Ok ts
              with Failure s -> `Error s
            end
        | _ -> `Error "Not a json array."
      with exn -> `Error (Printexc.to_string exn)
  end
end

module API (H: HTTP_CLIENT) = struct
  open H

  module Ticker = struct
    module Raw = struct
      module T = struct
        type t = {
          high: string;
          last: string;
          timestamp: string;
          bid: string;
          volume: string;
          vwap: string;
          low: string;
          ask: string;
        } [@@deriving yojson]
      end
      include T
      include Stringable.Of_jsonable(T)

      let ticker () = get "ticker/" [] of_string
    end

    type t = {
      high: float; last: float; timestamp: float; bid: float;
      volume: float; vwap: float; low: float; ask: float
    } [@@deriving show]

    let of_raw r =
      {
        high = float_of_string r.Raw.high;
        last = float_of_string r.Raw.last;
        timestamp = float_of_string r.Raw.timestamp;
        bid = float_of_string r.Raw.bid;
        volume = float_of_string r.Raw.volume;
        vwap = float_of_string r.Raw.vwap;
        low = float_of_string r.Raw.low;
        ask = float_of_string r.Raw.ask;
      }
    let ticker () = Raw.ticker () >>= fun t -> return @@ of_raw t
  end

  module Order_book = struct
    module Raw = struct
      module T = struct
        type t = {
          timestamp: string;
          bids: string list list;
          asks: string list list;
        } [@@deriving yojson]
      end

      include T
      include Stringable.Of_jsonable(T)

      let orders ?(group=true) () =
        get "order_book/" ["group", if group then "1" else "0"] of_string
    end

    type order = { price: float; amount: float } [@@deriving show]
    let pa_of_list = function
      | [ price; amount ] -> { price = float_of_string price;
                               amount = float_of_string amount }
      | _ -> invalid_arg "pq_of_string"

    type t = {
      timestamp: float;
      bids: order list;
      asks: order list
    } [@@deriving show]

    let of_raw r =
      { timestamp = float_of_string r.Raw.timestamp;
        bids = List.map pa_of_list r.Raw.bids;
        asks = List.map pa_of_list r.Raw.asks;
      }
    let orders ?(group=true) () = Raw.orders ~group () >>= fun t -> return @@ of_raw t
  end

  module Transaction = struct
    module Raw = struct
      module T = struct
        type t = {
          date: string;
          tid: int;
          price: string;
          amount: string;
        } [@@deriving yojson]

        let compare t t' = Pervasives.compare t.tid t'.tid
      end

      include T
      include Stringable.Of_jsonable(T)

      let transactions ?(offset=0) ?(limit=100) ?(sort="desc") () =
        let params =
          ["offset", offset |> string_of_int;
           "limit", limit |> string_of_int;
           "sort", sort
          ] in
        get "transactions/" params ts_of_string
    end

    type t = {
      date: float;
      tid: int;
      price: float;
      amount: float
    } [@@deriving show]

    let of_raw r =
      { date = float_of_string r.Raw.date; tid = r.Raw.tid;
        price = float_of_string r.Raw.price;
        amount = float_of_string r.Raw.amount;
      }

    let transactions ?(offset=0) ?(limit=100) ?(sort="desc") () =
      Raw.transactions ~offset ~limit ~sort () >>= fun ts -> return @@ List.map of_raw ts
  end

  module Eur_usd = struct
    module Raw = struct
      module T = struct
        type t = {
          sell: string;
          buy: string;
        } [@@deriving yojson]
      end

      include T
      include Stringable.Of_jsonable(T)

      let conversion_rate () = get "eur_usd/" [] of_string
    end

    type t = { sell: float; buy: float } [@@deriving show]
    let of_raw r =
      { sell = float_of_string r.Raw.sell;
        buy = float_of_string r.Raw.buy; }

    let conversion_rate () = Raw.conversion_rate () >>= fun t -> return @@ of_raw t
  end

  module Balance = struct
    module Raw = struct
      module T = struct
        type t = {
          usd_balance: string;
          btc_balance: string;
          usd_reserved: string;
          btc_reserved: string;
          usd_available: string;
          btc_available: string;
          fee: string;
        } [@@deriving yojson]
      end

      include T
      include Stringable.Of_jsonable(T)

      let balance c = post c "balance/" [] of_string
    end

    type t = { usd_balance: float; btc_balance: float;
               usd_reserved: float; btc_reserved: float;
               usd_available: float; btc_available: float;
               fee: float;
             } [@@deriving show]
    let of_raw r = {
      usd_balance = float_of_string r.Raw.usd_balance;
      btc_balance = float_of_string r.Raw.btc_balance;
      usd_reserved = float_of_string r.Raw.usd_reserved;
      btc_reserved = float_of_string r.Raw.btc_reserved;
      usd_available = float_of_string r.Raw.usd_available;
      btc_available = float_of_string r.Raw.btc_available;
      fee = float_of_string r.Raw.usd_balance; }

    let balance c = Raw.balance c >>= fun t -> return @@ of_raw t
  end

  module User_transaction = struct
    module Raw = struct
      module T = struct
        type t = {
          datetime: string;
          id: int;
          type_ [@key "type"]: string;
          usd: string;
          btc: string;
          fee: string;
          order_id: int;
        } [@@deriving yojson]

        let compare t t' = Pervasives.compare t.id t'.id
      end

      include T
      include Stringable.Of_jsonable(T)

      let transactions ?(offset=0) ?(limit=100) ?(sort="desc") c =
        let params = [
          "offset", string_of_int offset;
          "limit", string_of_int limit;
          "sort", sort
        ] in
        post c "user_transactions/" params ts_of_string
    end

    let type_of_string = function
      | "deposit" -> `Deposit
      | "withdrawal" -> `Withdrawal
      | "trade" -> `Trade
      | _ -> invalid_arg "type_of_string"
    type t = { datetime: float; id: int;
               type_: [`Deposit | `Withdrawal | `Trade];
               usd: float; btc: float; fee: float; order_id: int;
             } [@@deriving show]

    let of_raw r = {
      datetime = float_of_string r.Raw.datetime;
      id = r.Raw.id; type_ = type_of_string r.Raw.type_;
      usd = float_of_string r.Raw.usd;
      btc = float_of_string r.Raw.btc;
      fee = float_of_string r.Raw.fee;
      order_id = r.Raw.order_id; }

    let transactions ?(offset=0) ?(limit=100) ?(sort="desc") c =
      Raw.transactions ~offset ~limit ~sort c >>= fun t -> return @@ List.map of_raw t
  end

  module Order = struct
    module Raw = struct
      module T = struct
        type t = {
          id: int;
          datetime: string;
          type_ [@key "type"]: string;
          price: string;
          amount: string;
        } [@@deriving yojson]

        let compare t t' = Pervasives.compare t.id t'.id
      end

      include T
      include Stringable.Of_jsonable(T)

      let open_orders c = post c "open_orders/" [] ts_of_string
      let buy c ~price ~amount =
        post c "buy/"
          ["price", string_of_float price;
           "amount", string_of_float amount] of_string
      let sell c ~price ~amount =
        post c "sell/"
          ["price", string_of_float price;
           "amount", string_of_float amount] of_string
      let cancel c id =
        post c "cancel_order/" ["id", string_of_int id]
          (function "true" -> `Ok () | e -> `Error e)
    end

    let type_of_string = function
      | "buy" -> `Buy | "sell" -> `Sell | _ -> invalid_arg "type_of_string"

    type t = {
      id: int; datetime: float; type_: [`Buy | `Sell];
      price: float; amount: float; } [@@deriving show]

    let of_raw r =
      { id = r.Raw.id; datetime = float_of_string r.Raw.datetime;
        type_ = type_of_string r.Raw.type_;
        price = float_of_string r.Raw.price;
        amount = float_of_string r.Raw.amount;
      }

    let open_orders c = Raw.open_orders c >>= fun t -> return @@ List.map of_raw t

    let buy c ~price ~amount = Raw.buy c ~price ~amount >>= fun t -> return @@ of_raw t
    let sell c ~price ~amount = Raw.sell c ~price ~amount >>= fun t -> return @@ of_raw t
    let cancel = Raw.cancel
  end

  module Withdraw = struct
    module Raw = struct
      module T = struct
        type t = {
          id: string;
          datetime: string;
          type_: int;
          amount: string;
          status: int;
          data: string;
        } [@@deriving yojson]

        let compare t t' = Pervasives.compare t.id t'.id
      end

      include T
      include Stringable.Of_jsonable(T)

      let requests c = post c "withdrawal_requests/" [] ts_of_string
      let btc c ~amount ~address = post c "bitcoin_withdrawal/"
          ["amount", string_of_float amount;
           "address", address
          ] (fun s -> Yojson.Safe.from_string s |> function
            | `Assoc ["id", `String id] -> `Ok (int_of_string id)
            | _ -> `Error s
            )
      let ripple c ~amount ~address ~currency = post c "ripple_withdrawal/"
          ["amount", string_of_float amount;
           "address", address;
           "currency", currency
          ] (function "true" -> `Ok () | e -> `Error e)
    end

    let type_of_int = function
      | 0 -> `Sepa | 1 -> `Bitcoin | 2 -> `Wire
      | _ -> invalid_arg "type_of_int"
    let status_of_int = function
      | 0 -> `Open | 1 -> `In_process | 2 -> `Finished | 3 -> `Cancelled
      | 4 -> `Failed | _ -> invalid_arg "status_of_int"

    type t = {
      id: int;
      datetime: float;
      type_: [`Sepa | `Bitcoin | `Wire];
      amount: float;
      status: [`Open | `In_process | `Finished | `Cancelled | `Failed];
      data: string;
    } [@@deriving show]

    let of_raw r =
      { id = int_of_string r.Raw.id;
        datetime = float_of_string r.Raw.datetime;
        type_ = type_of_int r.Raw.type_;
        amount = float_of_string r.Raw.amount;
        status = status_of_int r.Raw.status;
        data = r.Raw.data;
      }

    let requests c = Raw.requests c >>= fun t -> return @@ List.map of_raw t
    let btc = Raw.btc
    let ripple = Raw.ripple
  end

  module Deposit = struct
    module Raw = struct
      module T = struct
        type t = {
          amount: string;
          address: string;
          confirmations: string
        } [@@deriving yojson]
      end

      include T
      include Stringable.Of_jsonable(T)

      let unconfirmeds c = post c "unconfirmed_btc/" [] ts_of_string
      (* TODO: encapsulate address and Base58Check it. *)
      let btc_address c = post c "bitcoin_deposit_address/" [] (fun s -> `Ok s)
      let ripple_address c = post c "ripple_deposit_address/" [] (fun s -> `Ok s)
    end

    type t = {
      amount: float;
      address: string;
      confirmations: int;
    } [@@deriving show]

    let of_raw r =
      { amount = float_of_string r.Raw.amount;
        address = r.Raw.address;
        confirmations = int_of_string r.Raw.confirmations; }
    let unconfirmeds c = Raw.unconfirmeds c >>= fun t -> return @@ List.map of_raw t
    let btc_address = Raw.btc_address
    let ripple_address = Raw.ripple_address
  end
end
