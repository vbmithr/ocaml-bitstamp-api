open Bitstamp

module Http_lwt(IO: Cohttp.S.IO
                with type 'a t = 'a Lwt.t
                 and type ic = Lwt_io.input_channel
                 and type oc = Lwt_io.output_channel
                 and type conn = Conduit_lwt_unix.flow
               ) = struct

  module Request = Cohttp_lwt.Make_request(IO)
  module Response = Cohttp_lwt.Make_response(IO)

  module type C = sig
    include Cohttp_lwt.Client
      with module IO = IO
       and module Request = Request
       and module Response = Response
       and type ctx = Cohttp_lwt_unix_net.ctx
    val custom_ctx: ?ctx:Conduit_lwt_unix.ctx -> ?resolver:Resolver_lwt.t -> unit -> ctx
  end

  module Client = struct
    include
      Cohttp_lwt.Make_client(IO)(Request)(Response)(Cohttp_lwt_unix_net)
    let custom_ctx = Cohttp_lwt_unix_net.custom_ctx
  end

  open IO
  module CB = Cohttp_lwt_body

  (* GET / unauthentified *)

  let get endpoint params type_of_string =
    let uri = mk_uri endpoint in
    Client.get Uri.(with_query' uri params) >>= fun (resp, body) ->
    CB.to_string body >>= fun s ->
    try
      type_of_string s |> function | `Ok r -> return r
                                   | `Error reason -> Lwt.fail @@ Failure reason
    with exn -> Lwt.fail exn

  (* POST / authentified *)

  let post c endpoint params type_of_string =
    let uri = mk_uri endpoint in
    let nonce, sign = Credentials.Signature.make c in
    let params = Cohttp.Header.of_list
        (["key", c.Credentials.key;
          "signature", sign;
          "nonce", nonce]
         @ params)
    in Client.post_form ~params uri >>= fun (resp, body) ->
    CB.to_string body >>= fun s ->
    try
      type_of_string s |> function | `Ok r -> return r
                                   | `Error reason -> Lwt.fail @@ Failure reason
    with exn -> Lwt.fail exn
end

module Lwt_API = API(Http_lwt)(Cohttp_lwt_unix_io)
include Lwt_API
