include Cohttp_lwt.IO

val get : string -> (string * string) list ->
  (string -> [< `Error of string | `Ok of 'a ]) -> 'a t

val post : Bitstamp.Credentials.t -> string -> (string * string) list ->
  (string -> [< `Error of string | `Ok of 'a ]) -> 'a t
