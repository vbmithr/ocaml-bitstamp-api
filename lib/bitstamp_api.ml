module type JSONABLE = sig
  type t
  val to_yojson : t -> Yojson.Safe.json
  val of_yojson : Yojson.Safe.json -> [`Ok of t | `Error of string]
end

module Stringable = struct
  module Of_jsonable (T: JSONABLE) = struct
    let to_string t = T.to_yojson t |> Yojson.Safe.to_string
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

module Ticker = struct
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
end

module Order_book = struct
  module T = struct
    type t = {
      timestamp: string;
      bids: string list list;
      asks: string list list;
    } [@@deriving yojson]
  end

  include T
  include Stringable.Of_jsonable(T)
end

module Transaction = struct
  module T = struct
    type t = {
      date: string;
      tid: int;
      price: string;
      amount: string
    } [@@deriving yojson]

    let compare t t' = Pervasives.compare t.tid t'.tid
  end

  include T
  include Stringable.Of_jsonable(T)
end

module Eur_usd = struct
  module T = struct
    type t = {
      sell: string;
      buy: string
    } [@@deriving yojson]
  end

  include T
  include Stringable.Of_jsonable(T)
end

module Balance = struct
  module T = struct
    type t = {
      usd_balance: string;
      btc_balance: string;
      usd_reserved: string;
      btc_reserved: string;
      usd_available: string;
      btc_available: string;
      fee: string
    } [@@deriving yojson]
  end

  include T
  include Stringable.Of_jsonable(T)
end

module User_transaction = struct
  module T = struct
    type t = {
      datetime: string;
      id: string;
      type_: string;
      usd: string;
      btc: string;
      fee: string;
      order_id: string
    } [@@deriving yojson]

    let compare t t' = Pervasives.compare t.id t'.id
  end

  include T
  include Stringable.Of_jsonable(T)
end

module Order = struct
  module T = struct
    type t = {
      id: string;
      datetime: string;
      type_: string;
      price: string;
      amount: string
    } [@@deriving yojson]

    let compare t t' = Pervasives.compare t.id t'.id
  end

  include T
  include Stringable.Of_jsonable(T)
end

module Code = struct
  module T = struct
    type t = {
      usd: string;
      btc: string
    } [@@deriving yojson]
  end

  include T
  include Stringable.Of_jsonable(T)
end

module Withdrawal_request = struct
  module T = struct
    type t = {
      id: string;
      datetime: string;
      type_: int;
      amount: string;
      status: int;
      data: string
    } [@@deriving yojson]

    let compare t t' = Pervasives.compare t.id t'.id
  end

  include T
  include Stringable.Of_jsonable(T)
end

module Unconfirmed = struct
  module T = struct
    type t = {
      amount: string;
      address: string;
      confirmations: string
    } [@@deriving yojson]
  end

  include T
  include Stringable.Of_jsonable(T)
end
