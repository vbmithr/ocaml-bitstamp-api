open Lwt
open Bitstamp

include Cohttp_lwt_unix_io

module CU = Cohttp_lwt_unix
module CB = Cohttp_lwt_body

(* GET / unauthentified *)

let get endpoint params type_of_string =
  let uri = mk_uri endpoint in
  CU.Client.get Uri.(with_query' uri params) >>= fun (resp, body) ->
  CB.to_string body >>= fun s ->
  try
    type_of_string s |> function | `Ok r -> return r
                                 | `Error reason -> Lwt.fail @@ Failure reason
  with exn -> Lwt.fail exn

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
  CU.Client.post_form ~params uri >>= fun (resp, body) ->
  CB.to_string body >>= fun s ->
  try
    type_of_string s |> function | `Ok r -> return r
                                 | `Error reason -> Lwt.fail @@ Failure reason
  with exn -> Lwt.fail exn

