open Lwt

open Types

module C = Cohttp
module CU = Cohttp_lwt_unix
module CB = Cohttp_lwt_body

let base_uri = "https://www.bitstamp.net/api/"
let mk_uri section = base_uri ^ section |> Uri.of_string

(* GET / unauthentified *)

let get endpoint params type_of_string =
  let uri = mk_uri endpoint in
  CU.Client.get Uri.(with_query' uri params) >>= fun (resp, body) ->
  CB.to_string body >|= type_of_string

let ticker () = get "ticker/" [] Ticker.of_string

let order_book ?(group=true) () =
  get "order_book/" ["group", if group then "1" else "0"] Order_book.of_string

let transactions ?(offset=0) ?(limit=100) ?(sort="desc") () =
  let params = ["offset", offset |> string_of_int;
                "limit", limit |> string_of_int;
                "sort", sort
               ] in
  get "transactions/" params Transaction.ts_of_string

let eur_usd () = get "eur_usd/" [] Eur_usd.of_string

(* POST / authentified *)

let id = ref ""
let key = ref ""
let secret = ref ""

let set_credentials ~user_id ~user_key ~user_secret =
  id := user_id;
  key := user_key;
  secret := user_secret

let mk_signature () =
  let open Cryptokit in
  let nonce = Printf.sprintf "%.0f" (Unix.time ()) in
  let msg = nonce ^ !id ^ !key in
  let hash = MAC.hmac_sha256 !secret in
  let res_bin = hash_string hash msg in
  let res_hexa =
  transform_string (Hexa.encode ()) res_bin
  |> String.uppercase in
  nonce, res_hexa

let post endpoint params type_of_json =
  let uri = mk_uri endpoint in
  let nonce, sign = mk_signature () in
  let params = Cohttp.Header.of_list
      (["key", !key;
        "signature", sign;
        "nonce", nonce]
       @ params)
  in
  CU.Client.post_form ~params uri
  >>= fun (resp, body) ->
  CB.to_string body >|= fun s ->
  try `Ok (type_of_json s) with _ -> `Error s

let balance () = post "balance/" [] Balance.of_string

let user_transactions ?(offset=0) ?(limit=100) ?(sort="desc") () =
  let params = [
    "offset", string_of_int offset;
    "limit", string_of_int limit;
    "sort", sort
  ] in
  post "user_transactions/" params User_transaction.ts_of_string

let open_orders () = post "open_orders/" [] Order.ts_of_string

let cancel_order id =
  post "cancel_order/" ["id", id] (fun s -> s = "true")

let sell ~price ~amount =
  post "sell/" ["price", string_of_float price;
                "amount", string_of_float amount] Order.of_string

let buy ~price ~amount =
  post "buy/" ["price", string_of_float price;
               "amount", string_of_float amount] Order.of_string

let check_code code =
  post "check_code/" ["code", code] Code.of_string

let redeem_code code =
  post "redeem_code/" ["code", code] Code.of_string

let withdrawal_requests () =
  post "withdrawal_requests/" [] Withdrawal_request.ts_of_string

let bitcoin_withdrawal ~amount ~address =
  post "bitcoin_withdrawal/" ["amount", string_of_float amount;
                              "address", address
                             ] (fun s -> s = "true")
let ripple_withdrawal ~amount ~address ~currency =
  post "ripple_withdrawal/" ["amount", string_of_float amount;
                             "address", address;
                             "currency", currency
                            ] (fun s -> s = "true")

let btc_deposit_address () =
  post "bitcoin_deposit_address/" [] (fun s -> s)

let ripple_deposit_address () =
  post "ripple_deposit_address/" [] (fun s -> s)

let unconfirmed_deposits () =
  post "unconfirmed_btc/" [] Unconfirmed.ts_of_string
