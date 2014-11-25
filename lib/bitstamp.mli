open Bitstamp_api

val ticker : unit ->
  [ `Error of string | `Ok of Ticker.T.t ] Lwt.t

val order_book : ?group:bool -> unit ->
  [ `Error of string | `Ok of Order_book.T.t ] Lwt.t

val transactions : ?offset:int -> ?limit:int -> ?sort:string -> unit ->
  [ `Error of string | `Ok of Transaction.T.t list ] Lwt.t

val eur_usd : unit -> [ `Error of string | `Ok of Eur_usd.T.t ] Lwt.t

val balance : unit ->
  [> `Error of string
  | `Ok of [ `Error of string | `Ok of Balance.T.t ] ] Lwt.t

val user_transactions : ?offset:int -> ?limit:int -> ?sort:string -> unit ->
  [> `Error of string
  | `Ok of [> `Error of string | `Ok of User_transaction.T.t list ] ] Lwt.t

val open_orders : unit ->
  [> `Error of string
  | `Ok of [> `Error of string | `Ok of Order.T.t list ] ] Lwt.t

val cancel_order : string -> [> `Error of string | `Ok of bool ] Lwt.t

val sell : price:float -> amount:float ->
  [> `Error of string
  | `Ok of [ `Error of string | `Ok of Order.T.t ] ] Lwt.t

val buy : price:float -> amount:float ->
  [> `Error of string | `Ok of [ `Error of string | `Ok of Order.T.t ] ] Lwt.t

val check_code : string ->
  [> `Error of string | `Ok of [ `Error of string | `Ok of Code.T.t ] ] Lwt.t

val redeem_code : string ->
  [> `Error of string | `Ok of [ `Error of string | `Ok of Code.T.t ] ] Lwt.t

val withdrawal_requests : unit ->
  [> `Error of string
  | `Ok of [> `Error of string | `Ok of Withdrawal_request.T.t list ] ] Lwt.t

val bitcoin_withdrawal : amount:float -> address:string ->
  [> `Error of string | `Ok of bool ] Lwt.t

val ripple_withdrawal : amount:float -> address:string -> currency:string ->
  [> `Error of string | `Ok of bool ] Lwt.t

val btc_deposit_address : unit -> [> `Error of string | `Ok of string ] Lwt.t

val ripple_deposit_address : unit -> [> `Error of string | `Ok of string ] Lwt.t

val unconfirmed_deposits : unit ->
  [> `Error of string
  | `Ok of [> `Error of string | `Ok of Unconfirmed.T.t list ] ] Lwt.t

module HL :
  sig
    val all_bitstamp_transactions : ?waitfor:float -> ?offset:int ->
      ?limit:int -> out_channel -> unit Lwt.t
  end
