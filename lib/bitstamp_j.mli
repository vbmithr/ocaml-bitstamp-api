(* Auto-generated from "bitstamp.atd" *)


type ticker = Bitstamp_t.ticker = {
  ticker_high (*atd high *): string;
  ticker_last (*atd last *): string;
  ticker_timestamp (*atd timestamp *): string;
  ticker_bid (*atd bid *): string;
  ticker_volume (*atd volume *): string;
  ticker_low (*atd low *): string;
  ticker_ask (*atd ask *): string
}

type order_book = Bitstamp_t.order_book = {
  order_book_timestamp (*atd timestamp *): string;
  order_book_bids (*atd bids *): string list list;
  order_book_asks (*atd asks *): string list list
}

type transaction = Bitstamp_t.transaction = {
  transaction_date (*atd date *): string;
  transaction_tid (*atd tid *): int;
  transaction_price (*atd price *): string;
  transaction_amount (*atd amount *): string
}

type transactions = Bitstamp_t.transactions

type eur_usd = Bitstamp_t.eur_usd = {
  eur_usd_sell (*atd sell *): string;
  eur_usd_buy (*atd buy *): string
}

type balance = Bitstamp_t.balance = {
  balance_usd_balance (*atd usd_balance *): string;
  balance_btc_balance (*atd btc_balance *): string;
  balance_usd_reserved (*atd usd_reserved *): string;
  balance_btc_reserved (*atd btc_reserved *): string;
  balance_usd_available (*atd usd_available *): string;
  balance_btc_available (*atd btc_available *): string;
  balance_fee (*atd fee *): string
}

type user_transaction = Bitstamp_t.user_transaction = {
  transaction_datetime (*atd datetime *): string;
  transaction_id (*atd id *): string;
  transaction_type_ (*atd type_ *): string;
  transaction_usd (*atd usd *): string;
  transaction_btc (*atd btc *): string;
  transaction_fee (*atd fee *): string;
  transaction_order_id (*atd order_id *): string
}

type user_transactions = Bitstamp_t.user_transactions

type order = Bitstamp_t.order = {
  open_order_id (*atd id *): string;
  open_order_datetime (*atd datetime *): string;
  open_order_type_ (*atd type_ *): string;
  open_order_price (*atd price *): string;
  open_order_amount (*atd amount *): string
}

type orders = Bitstamp_t.orders

type code = Bitstamp_t.code = {
  code_usd (*atd usd *): string;
  code_btc (*atd btc *): string
}

type withdrawal = Bitstamp_t.withdrawal = {
  withdrawal_id (*atd id *): string;
  withdrawal_datetime (*atd datetime *): string;
  withdrawal_type_ (*atd type_ *): int;
  withdrawal_amount (*atd amount *): string;
  withdrawal_status (*atd status *): int;
  withdrawal_data (*atd data *): string
}

type withdrawal_requests = Bitstamp_t.withdrawal_requests

type unconfirmed = Bitstamp_t.unconfirmed = {
  unconfirmed_amount (*atd amount *): string;
  unconfirmed_address (*atd address *): string;
  unconfirmed_confirmations (*atd confirmations *): string
}

type unconfirmeds = Bitstamp_t.unconfirmeds

val write_ticker :
  Bi_outbuf.t -> ticker -> unit
  (** Output a JSON value of type {!ticker}. *)

val string_of_ticker :
  ?len:int -> ticker -> string
  (** Serialize a value of type {!ticker}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ticker :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ticker
  (** Input JSON data of type {!ticker}. *)

val ticker_of_string :
  string -> ticker
  (** Deserialize JSON data of type {!ticker}. *)

val write_order_book :
  Bi_outbuf.t -> order_book -> unit
  (** Output a JSON value of type {!order_book}. *)

val string_of_order_book :
  ?len:int -> order_book -> string
  (** Serialize a value of type {!order_book}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_order_book :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> order_book
  (** Input JSON data of type {!order_book}. *)

val order_book_of_string :
  string -> order_book
  (** Deserialize JSON data of type {!order_book}. *)

val write_transaction :
  Bi_outbuf.t -> transaction -> unit
  (** Output a JSON value of type {!transaction}. *)

val string_of_transaction :
  ?len:int -> transaction -> string
  (** Serialize a value of type {!transaction}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_transaction :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> transaction
  (** Input JSON data of type {!transaction}. *)

val transaction_of_string :
  string -> transaction
  (** Deserialize JSON data of type {!transaction}. *)

val write_transactions :
  Bi_outbuf.t -> transactions -> unit
  (** Output a JSON value of type {!transactions}. *)

val string_of_transactions :
  ?len:int -> transactions -> string
  (** Serialize a value of type {!transactions}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_transactions :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> transactions
  (** Input JSON data of type {!transactions}. *)

val transactions_of_string :
  string -> transactions
  (** Deserialize JSON data of type {!transactions}. *)

val write_eur_usd :
  Bi_outbuf.t -> eur_usd -> unit
  (** Output a JSON value of type {!eur_usd}. *)

val string_of_eur_usd :
  ?len:int -> eur_usd -> string
  (** Serialize a value of type {!eur_usd}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_eur_usd :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> eur_usd
  (** Input JSON data of type {!eur_usd}. *)

val eur_usd_of_string :
  string -> eur_usd
  (** Deserialize JSON data of type {!eur_usd}. *)

val write_balance :
  Bi_outbuf.t -> balance -> unit
  (** Output a JSON value of type {!balance}. *)

val string_of_balance :
  ?len:int -> balance -> string
  (** Serialize a value of type {!balance}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_balance :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> balance
  (** Input JSON data of type {!balance}. *)

val balance_of_string :
  string -> balance
  (** Deserialize JSON data of type {!balance}. *)

val write_user_transaction :
  Bi_outbuf.t -> user_transaction -> unit
  (** Output a JSON value of type {!user_transaction}. *)

val string_of_user_transaction :
  ?len:int -> user_transaction -> string
  (** Serialize a value of type {!user_transaction}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_user_transaction :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> user_transaction
  (** Input JSON data of type {!user_transaction}. *)

val user_transaction_of_string :
  string -> user_transaction
  (** Deserialize JSON data of type {!user_transaction}. *)

val write_user_transactions :
  Bi_outbuf.t -> user_transactions -> unit
  (** Output a JSON value of type {!user_transactions}. *)

val string_of_user_transactions :
  ?len:int -> user_transactions -> string
  (** Serialize a value of type {!user_transactions}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_user_transactions :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> user_transactions
  (** Input JSON data of type {!user_transactions}. *)

val user_transactions_of_string :
  string -> user_transactions
  (** Deserialize JSON data of type {!user_transactions}. *)

val write_order :
  Bi_outbuf.t -> order -> unit
  (** Output a JSON value of type {!order}. *)

val string_of_order :
  ?len:int -> order -> string
  (** Serialize a value of type {!order}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_order :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> order
  (** Input JSON data of type {!order}. *)

val order_of_string :
  string -> order
  (** Deserialize JSON data of type {!order}. *)

val write_orders :
  Bi_outbuf.t -> orders -> unit
  (** Output a JSON value of type {!orders}. *)

val string_of_orders :
  ?len:int -> orders -> string
  (** Serialize a value of type {!orders}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_orders :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> orders
  (** Input JSON data of type {!orders}. *)

val orders_of_string :
  string -> orders
  (** Deserialize JSON data of type {!orders}. *)

val write_code :
  Bi_outbuf.t -> code -> unit
  (** Output a JSON value of type {!code}. *)

val string_of_code :
  ?len:int -> code -> string
  (** Serialize a value of type {!code}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_code :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> code
  (** Input JSON data of type {!code}. *)

val code_of_string :
  string -> code
  (** Deserialize JSON data of type {!code}. *)

val write_withdrawal :
  Bi_outbuf.t -> withdrawal -> unit
  (** Output a JSON value of type {!withdrawal}. *)

val string_of_withdrawal :
  ?len:int -> withdrawal -> string
  (** Serialize a value of type {!withdrawal}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_withdrawal :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> withdrawal
  (** Input JSON data of type {!withdrawal}. *)

val withdrawal_of_string :
  string -> withdrawal
  (** Deserialize JSON data of type {!withdrawal}. *)

val write_withdrawal_requests :
  Bi_outbuf.t -> withdrawal_requests -> unit
  (** Output a JSON value of type {!withdrawal_requests}. *)

val string_of_withdrawal_requests :
  ?len:int -> withdrawal_requests -> string
  (** Serialize a value of type {!withdrawal_requests}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_withdrawal_requests :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> withdrawal_requests
  (** Input JSON data of type {!withdrawal_requests}. *)

val withdrawal_requests_of_string :
  string -> withdrawal_requests
  (** Deserialize JSON data of type {!withdrawal_requests}. *)

val write_unconfirmed :
  Bi_outbuf.t -> unconfirmed -> unit
  (** Output a JSON value of type {!unconfirmed}. *)

val string_of_unconfirmed :
  ?len:int -> unconfirmed -> string
  (** Serialize a value of type {!unconfirmed}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_unconfirmed :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> unconfirmed
  (** Input JSON data of type {!unconfirmed}. *)

val unconfirmed_of_string :
  string -> unconfirmed
  (** Deserialize JSON data of type {!unconfirmed}. *)

val write_unconfirmeds :
  Bi_outbuf.t -> unconfirmeds -> unit
  (** Output a JSON value of type {!unconfirmeds}. *)

val string_of_unconfirmeds :
  ?len:int -> unconfirmeds -> string
  (** Serialize a value of type {!unconfirmeds}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_unconfirmeds :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> unconfirmeds
  (** Input JSON data of type {!unconfirmeds}. *)

val unconfirmeds_of_string :
  string -> unconfirmeds
  (** Deserialize JSON data of type {!unconfirmeds}. *)

