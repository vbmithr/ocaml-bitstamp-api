open Async.Std
open Cohttp_async
open Bitstamp

include Cohttp_async_io

let base_uri = "https://www.bitstamp.net/api/"
let mk_uri section = Uri.of_string @@ base_uri ^ section

(* GET / unauthentified *)

let get endpoint params type_of_string =
  let uri = mk_uri endpoint in
  Client.get Uri.(with_query' uri params) >>= fun (resp, body) ->
  Body.to_string body >>= fun s ->
  try
    type_of_string s |> function | `Ok r -> return r
                                 | `Error reason -> failwith reason
  with exn -> raise exn

(* POST / authentified *)

let post c endpoint params type_of_string =
  let uri = mk_uri endpoint in
  let nonce, sign = Credentials.Signature.make c in
  let params =
    (["key", [c.Credentials.key];
      "signature", [sign];
      "nonce", [nonce]]
     @ List.map (fun (k, v) -> k, [v]) params)
  in
  Client.post_form ~params uri >>= fun (resp, body) ->
  Body.to_string body >>= fun s ->
  try
    type_of_string s |> function | `Ok r -> return r
                                 | `Error reason -> failwith reason
  with exn -> raise exn

