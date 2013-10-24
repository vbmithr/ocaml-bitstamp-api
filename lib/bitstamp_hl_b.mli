(* Auto-generated from "bitstamp_hl.atd" *)


type transaction = Bitstamp_hl_t.transaction = {
  tid: int;
  datetime: float;
  price: float;
  amount: float
}

(* Writers for type transaction *)

val transaction_tag : Bi_io.node_tag
  (** Tag used by the writers for type {!transaction}.
      Readers may support more than just this tag. *)

val write_untagged_transaction :
  Bi_outbuf.t -> transaction -> unit
  (** Output an untagged biniou value of type {!transaction}. *)

val write_transaction :
  Bi_outbuf.t -> transaction -> unit
  (** Output a biniou value of type {!transaction}. *)

val string_of_transaction :
  ?len:int -> transaction -> string
  (** Serialize a value of type {!transaction} into
      a biniou string. *)

(* Readers for type transaction *)

val get_transaction_reader :
  Bi_io.node_tag -> (Bi_inbuf.t -> transaction)
  (** Return a function that reads an untagged
      biniou value of type {!transaction}. *)

val read_transaction :
  Bi_inbuf.t -> transaction
  (** Input a tagged biniou value of type {!transaction}. *)

val transaction_of_string :
  ?pos:int -> string -> transaction
  (** Deserialize a biniou value of type {!transaction}.
      @param pos specifies the position where
                 reading starts. Default: 0. *)

