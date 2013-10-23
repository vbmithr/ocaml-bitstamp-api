(* Auto-generated from "bitstamp.atd" *)


type ticker = {
  ticker_high (*atd high *): string;
  ticker_last (*atd last *): string;
  ticker_timestamp (*atd timestamp *): string;
  ticker_bid (*atd bid *): string;
  ticker_volume (*atd volume *): string;
  ticker_low (*atd low *): string;
  ticker_ask (*atd ask *): string
}

type order_book = {
  order_book_timestamp (*atd timestamp *): string;
  order_book_bids (*atd bids *): string list list;
  order_book_asks (*atd asks *): string list list
}

type transaction = {
  transaction_date (*atd date *): string;
  transaction_tid (*atd tid *): int;
  transaction_price (*atd price *): string;
  transaction_amount (*atd amount *): string
}

type transactions = transaction list

type eur_usd = {
  eur_usd_sell (*atd sell *): string;
  eur_usd_buy (*atd buy *): string
}

type balance = {
  balance_usd_balance (*atd usd_balance *): string;
  balance_btc_balance (*atd btc_balance *): string;
  balance_usd_reserved (*atd usd_reserved *): string;
  balance_btc_reserved (*atd btc_reserved *): string;
  balance_usd_available (*atd usd_available *): string;
  balance_btc_available (*atd btc_available *): string;
  balance_fee (*atd fee *): string
}

type user_transaction = {
  transaction_datetime (*atd datetime *): string;
  transaction_id (*atd id *): string;
  transaction_type_ (*atd type_ *): string;
  transaction_usd (*atd usd *): string;
  transaction_btc (*atd btc *): string;
  transaction_fee (*atd fee *): string;
  transaction_order_id (*atd order_id *): string
}

type user_transactions = user_transaction list

type order = {
  open_order_id (*atd id *): string;
  open_order_datetime (*atd datetime *): string;
  open_order_type_ (*atd type_ *): string;
  open_order_price (*atd price *): string;
  open_order_amount (*atd amount *): string
}

type orders = order list

type code = { code_usd (*atd usd *): string; code_btc (*atd btc *): string }

type withdrawal = {
  withdrawal_id (*atd id *): string;
  withdrawal_datetime (*atd datetime *): string;
  withdrawal_type_ (*atd type_ *): int;
  withdrawal_amount (*atd amount *): string;
  withdrawal_status (*atd status *): int;
  withdrawal_data (*atd data *): string
}

type withdrawal_requests = withdrawal list

type unconfirmed = {
  unconfirmed_amount (*atd amount *): string;
  unconfirmed_address (*atd address *): string;
  unconfirmed_confirmations (*atd confirmations *): string
}

type unconfirmeds = unconfirmed list
