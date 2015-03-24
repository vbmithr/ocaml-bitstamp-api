val mk_uri : string -> Uri.t

module Credentials : sig
  type t = private {
    id: string; key: string; secret: string;
  }

  val make : id:string -> key:string -> secret:string -> t

  module Signature : sig
    val make : t -> string * string
  end
end

module type HTTP_CLIENT = sig
  include Cohttp.S.IO

  val get : string -> (string * string) list ->
    (string -> [< `Error of string | `Ok of 'a ]) -> 'a t

  val post : Credentials.t -> string -> (string * string) list ->
    (string -> [< `Error of string | `Ok of 'a ]) -> 'a t
end

module API(H: HTTP_CLIENT) : sig

  (** {1 Public API} *)

  module Ticker :
  sig
    type t = private {
      high : float;
      last : float;
      timestamp : float;
      bid : float;
      volume : float;
      vwap : float;
      low : float;
      ask : float;
    } [@@deriving show]

    val ticker : unit -> t H.t
  end

  module Order_book :
  sig
    type order = private { price : float; amount : float; } [@@deriving show]

    type t = private {
      timestamp : float;
      bids : order list;
      asks : order list;
    } [@@deriving show]

    val orders : ?group:bool -> unit -> t H.t
  end

  module Transaction :
  sig
    type t = private {
      date : float;
      tid : int;
      price : float;
      amount : float;
    } [@@deriving show]

    val transactions : ?offset:int -> ?limit:int -> ?sort:string -> unit ->  t list H.t
  end

  module Eur_usd :
  sig
    type t = private {
      sell : float;
      buy : float;
    } [@@deriving show]

    val conversion_rate : unit -> t H.t
  end

  (** {1 Private API} *)


  module Balance :
  sig
    type t = private {
      usd_balance : float;
      btc_balance : float;
      usd_reserved : float;
      btc_reserved : float;
      usd_available : float;
      btc_available : float;
      fee : float;
    } [@@deriving show]

    val balance : Credentials.t -> t H.t
  end

  module User_transaction :
  sig
    val type_of_string : string -> [> `Deposit | `Trade | `Withdrawal ]
    type t = private {
      datetime : float;
      id : int;
      type_ : [ `Deposit | `Trade | `Withdrawal ];
      usd : float;
      btc : float;
      fee : float;
      order_id : int;
    } [@@deriving show]

    val transactions : ?offset:int -> ?limit:int -> ?sort:string -> Credentials.t -> t list H.t
  end

  module Order :
  sig
    val type_of_string : string -> [> `Buy | `Sell ]
    type t = private {
      id : int;
      datetime : float;
      type_ : [ `Buy | `Sell ];
      price : float;
      amount : float;
    } [@@deriving show]

    val open_orders : Credentials.t -> t list H.t
    val buy : Credentials.t -> price:float -> amount:float -> t H.t
    val sell : Credentials.t -> price:float -> amount:float -> t H.t
    val cancel : Credentials.t -> int -> unit H.t
  end

  module Withdraw :
  sig
    type t = private {
      id : int;
      datetime : float;
      type_ : [ `Bitcoin | `Sepa | `Wire ];
      amount : float;
      status : [ `Cancelled | `Failed | `Finished | `In_process | `Open ];
      data : string;
    } [@@deriving show]

    val requests : Credentials.t -> t list H.t
    val btc : Credentials.t -> amount:float -> address:string -> int H.t
    val ripple : Credentials.t -> amount:float -> address:string -> currency:string -> unit H.t
  end

  module Deposit :
  sig
    type t = private {
      amount : float;
      address : string;
      confirmations : int;
    } [@@deriving show]

    val unconfirmeds : Credentials.t -> t list H.t
    val btc_address : Credentials.t -> string H.t
    val ripple_address : Credentials.t -> string H.t
  end
end
