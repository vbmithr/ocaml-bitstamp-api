module Ticker = struct
  type t = {
    high: string;
    last: string;
    timestamp: string;
    bid: string;
    volume: string;
    low: string;
    ask: string
  } [@@deriving yojson]

  let to_string t = to_yojson t |> Yojson.Safe.to_string
  let of_string s = Yojson.Safe.from_string s |> of_yojson
end

module Order_book = struct
  type t = {
    timestamp: string;
    bids: string list list;
    asks: string list list;
  } [@@deriving yojson]

  let to_string t = to_yojson t |> Yojson.Safe.to_string
  let of_string s = Yojson.Safe.from_string s |> of_yojson
end

module Transaction = struct
  type t = {
    date: string;
    tid: int;
    price: string;
    amount: string
  } [@@deriving yojson]

  let compare t t' = Pervasives.compare t.tid t'.tid
  let to_string t = to_yojson t |> Yojson.Safe.to_string
  let of_string s = Yojson.Safe.from_string s |> of_yojson
  let ts_of_string s =
    let ts = Yojson.Safe.from_string s in
    try
      match ts with
      | `List ts ->
          begin
            try
              let ts = List.map
                  (fun t -> match of_yojson t with
                     | `Ok a -> a
                     | `Error s -> failwith s) ts
              in `Ok ts
            with Failure s -> `Error s
          end
      | _ -> `Error "Not a json array."
    with exn -> `Error (Printexc.to_string exn)
end

module Eur_usd = struct
  type t = {
    sell: string;
    buy: string
  } [@@deriving yojson]

  let to_string t = to_yojson t |> Yojson.Safe.to_string
  let of_string s = Yojson.Safe.from_string s |> of_yojson
end

module Balance = struct
  type t = {
    usd_balance: string;
    btc_balance: string;
    usd_reserved: string;
    btc_reserved: string;
    usd_available: string;
    btc_available: string;
    fee: string
  } [@@deriving yojson]

  let to_string t = to_yojson t |> Yojson.Safe.to_string
  let of_string s = Yojson.Safe.from_string s |> of_yojson
end

module User_transaction = struct
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
  let to_string t = to_yojson t |> Yojson.Safe.to_string
  let of_string s = Yojson.Safe.from_string s |> of_yojson
  let ts_of_string s =
    let ts = Yojson.Safe.from_string s in
    try
      match ts with
      | `List ts ->
          begin
            try
              let ts = List.map
                  (fun t -> match of_yojson t with
                     | `Ok a -> a
                     | `Error s -> failwith s) ts
              in `Ok ts
            with Failure s -> `Error s
          end
      | _ -> `Error "Not a json array."
    with exn -> `Error (Printexc.to_string exn)
end

module Order = struct
  type t = {
    id: string;
    datetime: string;
    type_: string;
    price: string;
    amount: string
  } [@@deriving yojson]

  let compare t t' = Pervasives.compare t.id t'.id
  let to_string t = to_yojson t |> Yojson.Safe.to_string
  let of_string s = Yojson.Safe.from_string s |> of_yojson
  let ts_of_string s =
    let ts = Yojson.Safe.from_string s in
    try
      match ts with
      | `List ts ->
          begin
            try
              let ts = List.map
                  (fun t -> match of_yojson t with
                     | `Ok a -> a
                     | `Error s -> failwith s) ts
              in `Ok ts
            with Failure s -> `Error s
          end
      | _ -> `Error "Not a json array."
    with exn -> `Error (Printexc.to_string exn)
end

module Code = struct
  type t = {
    usd: string;
    btc: string
  } [@@deriving yojson]

  let to_string t = to_yojson t |> Yojson.Safe.to_string
  let of_string s = Yojson.Safe.from_string s |> of_yojson
end

module Withdrawal_request = struct
  type t = {
    id: string;
    datetime: string;
    type_: int;
    amount: string;
    status: int;
    data: string
  } [@@deriving yojson]

  let compare t t' = Pervasives.compare t.id t'.id
  let to_string t = to_yojson t |> Yojson.Safe.to_string
  let of_string s = Yojson.Safe.from_string s |> of_yojson
  let ts_of_string s =
    let ts = Yojson.Safe.from_string s in
    try
      match ts with
      | `List ts ->
          begin
            try
              let ts = List.map
                  (fun t -> match of_yojson t with
                     | `Ok a -> a
                     | `Error s -> failwith s) ts
              in `Ok ts
            with Failure s -> `Error s
          end
      | _ -> `Error "Not a json array."
    with exn -> `Error (Printexc.to_string exn)
end

module Unconfirmed = struct
  type t = {
    amount: string;
    address: string;
    confirmations: string
  } [@@deriving yojson]

  let to_string t = to_yojson t |> Yojson.Safe.to_string
  let of_string s = Yojson.Safe.from_string s |> of_yojson
  let ts_of_string s =
    let ts = Yojson.Safe.from_string s in
    try
      match ts with
      | `List ts ->
          begin
            try
              let ts = List.map
                  (fun t -> match of_yojson t with
                     | `Ok a -> a
                     | `Error s -> failwith s) ts
              in `Ok ts
            with Failure s -> `Error s
          end
      | _ -> `Error "Not a json array."
    with exn -> `Error (Printexc.to_string exn)
end
