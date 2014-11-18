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

let write_ticker = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"high\":";
    (
      Yojson.Safe.write_string
    )
      ob x.ticker_high;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"last\":";
    (
      Yojson.Safe.write_string
    )
      ob x.ticker_last;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"timestamp\":";
    (
      Yojson.Safe.write_string
    )
      ob x.ticker_timestamp;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"bid\":";
    (
      Yojson.Safe.write_string
    )
      ob x.ticker_bid;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"volume\":";
    (
      Yojson.Safe.write_string
    )
      ob x.ticker_volume;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"low\":";
    (
      Yojson.Safe.write_string
    )
      ob x.ticker_low;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"ask\":";
    (
      Yojson.Safe.write_string
    )
      ob x.ticker_ask;
    Bi_outbuf.add_char ob '}';
)
let string_of_ticker ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_ticker ob x;
  Bi_outbuf.contents ob
let read_ticker = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        ticker_high = Obj.magic 0.0;
        ticker_last = Obj.magic 0.0;
        ticker_timestamp = Obj.magic 0.0;
        ticker_bid = Obj.magic 0.0;
        ticker_volume = Obj.magic 0.0;
        ticker_low = Obj.magic 0.0;
        ticker_ask = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 3 -> (
                match String.unsafe_get s pos with
                  | 'a' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'k' then (
                        6
                      )
                      else (
                        -1
                      )
                    )
                  | 'b' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'd' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | 'l' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'w' then (
                        5
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 4 -> (
                match String.unsafe_get s pos with
                  | 'h' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'h' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 'l' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' then (
                  4
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'p' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | 3 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            bits0 := !bits0 lor 0x8;
          | 4 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 4 (Obj.repr v);
            bits0 := !bits0 lor 0x10;
          | 5 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 5 (Obj.repr v);
            bits0 := !bits0 lor 0x20;
          | 6 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 6 (Obj.repr v);
            bits0 := !bits0 lor 0x40;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 3 -> (
                  match String.unsafe_get s pos with
                    | 'a' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'k' then (
                          6
                        )
                        else (
                          -1
                        )
                      )
                    | 'b' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'd' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 'l' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'w' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 4 -> (
                  match String.unsafe_get s pos with
                    | 'h' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'h' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 'l' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'p' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | 3 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              bits0 := !bits0 lor 0x8;
            | 4 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 4 (Obj.repr v);
              bits0 := !bits0 lor 0x10;
            | 5 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 5 (Obj.repr v);
              bits0 := !bits0 lor 0x20;
            | 6 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 6 (Obj.repr v);
              bits0 := !bits0 lor 0x40;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x7f then Ag_oj_run.missing_fields p [| !bits0 |] [| "high"; "last"; "timestamp"; "bid"; "volume"; "low"; "ask" |];
        Ag_oj_run.identity x
      )
)
let ticker_of_string s =
  read_ticker (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__1 = (
  Ag_oj_run.write_list (
    Yojson.Safe.write_string
  )
)
let string_of__1 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__1 ob x;
  Bi_outbuf.contents ob
let read__1 = (
  Ag_oj_run.read_list (
    Ag_oj_run.read_string
  )
)
let _1_of_string s =
  read__1 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__2 = (
  Ag_oj_run.write_list (
    write__1
  )
)
let string_of__2 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__2 ob x;
  Bi_outbuf.contents ob
let read__2 = (
  Ag_oj_run.read_list (
    read__1
  )
)
let _2_of_string s =
  read__2 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_order_book = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"timestamp\":";
    (
      Yojson.Safe.write_string
    )
      ob x.order_book_timestamp;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"bids\":";
    (
      write__2
    )
      ob x.order_book_bids;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"asks\":";
    (
      write__2
    )
      ob x.order_book_asks;
    Bi_outbuf.add_char ob '}';
)
let string_of_order_book ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_order_book ob x;
  Bi_outbuf.contents ob
let read_order_book = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        order_book_timestamp = Obj.magic 0.0;
        order_book_bids = Obj.magic 0.0;
        order_book_asks = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 4 -> (
                match String.unsafe_get s pos with
                  | 'a' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'k' && String.unsafe_get s (pos+3) = 's' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | 'b' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 's' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 9 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'p' then (
                  0
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                read__2
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                read__2
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  match String.unsafe_get s pos with
                    | 'a' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'k' && String.unsafe_get s (pos+3) = 's' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | 'b' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 's' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'p' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  read__2
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  read__2
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x7 then Ag_oj_run.missing_fields p [| !bits0 |] [| "timestamp"; "bids"; "asks" |];
        Ag_oj_run.identity x
      )
)
let order_book_of_string s =
  read_order_book (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_transaction = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"date\":";
    (
      Yojson.Safe.write_string
    )
      ob x.transaction_date;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"tid\":";
    (
      Yojson.Safe.write_int
    )
      ob x.transaction_tid;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"price\":";
    (
      Yojson.Safe.write_string
    )
      ob x.transaction_price;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"amount\":";
    (
      Yojson.Safe.write_string
    )
      ob x.transaction_amount;
    Bi_outbuf.add_char ob '}';
)
let string_of_transaction ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_transaction ob x;
  Bi_outbuf.contents ob
let read_transaction = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        transaction_date = Obj.magic 0.0;
        transaction_tid = Obj.magic 0.0;
        transaction_price = Obj.magic 0.0;
        transaction_amount = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'd' then (
                  1
                )
                else (
                  -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  -1
                )
              )
            | 5 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'e' then (
                  2
                )
                else (
                  -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' then (
                  3
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_int
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | 3 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            bits0 := !bits0 lor 0x8;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'e' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_int
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | 3 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              bits0 := !bits0 lor 0x8;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0xf then Ag_oj_run.missing_fields p [| !bits0 |] [| "date"; "tid"; "price"; "amount" |];
        Ag_oj_run.identity x
      )
)
let transaction_of_string s =
  read_transaction (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__3 = (
  Ag_oj_run.write_list (
    write_transaction
  )
)
let string_of__3 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__3 ob x;
  Bi_outbuf.contents ob
let read__3 = (
  Ag_oj_run.read_list (
    read_transaction
  )
)
let _3_of_string s =
  read__3 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_transactions = (
  write__3
)
let string_of_transactions ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_transactions ob x;
  Bi_outbuf.contents ob
let read_transactions = (
  read__3
)
let transactions_of_string s =
  read_transactions (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_eur_usd = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"sell\":";
    (
      Yojson.Safe.write_string
    )
      ob x.eur_usd_sell;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"buy\":";
    (
      Yojson.Safe.write_string
    )
      ob x.eur_usd_buy;
    Bi_outbuf.add_char ob '}';
)
let string_of_eur_usd ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_eur_usd ob x;
  Bi_outbuf.contents ob
let read_eur_usd = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        eur_usd_sell = Obj.magic 0.0;
        eur_usd_buy = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'b' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'y' then (
                  1
                )
                else (
                  -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'l' then (
                  0
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'b' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'y' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'l' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields p [| !bits0 |] [| "sell"; "buy" |];
        Ag_oj_run.identity x
      )
)
let eur_usd_of_string s =
  read_eur_usd (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_balance = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"usd_balance\":";
    (
      Yojson.Safe.write_string
    )
      ob x.balance_usd_balance;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"btc_balance\":";
    (
      Yojson.Safe.write_string
    )
      ob x.balance_btc_balance;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"usd_reserved\":";
    (
      Yojson.Safe.write_string
    )
      ob x.balance_usd_reserved;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"btc_reserved\":";
    (
      Yojson.Safe.write_string
    )
      ob x.balance_btc_reserved;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"usd_available\":";
    (
      Yojson.Safe.write_string
    )
      ob x.balance_usd_available;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"btc_available\":";
    (
      Yojson.Safe.write_string
    )
      ob x.balance_btc_available;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"fee\":";
    (
      Yojson.Safe.write_string
    )
      ob x.balance_fee;
    Bi_outbuf.add_char ob '}';
)
let string_of_balance ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_balance ob x;
  Bi_outbuf.contents ob
let read_balance = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        balance_usd_balance = Obj.magic 0.0;
        balance_btc_balance = Obj.magic 0.0;
        balance_usd_reserved = Obj.magic 0.0;
        balance_btc_reserved = Obj.magic 0.0;
        balance_usd_available = Obj.magic 0.0;
        balance_btc_available = Obj.magic 0.0;
        balance_fee = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'e' then (
                  6
                )
                else (
                  -1
                )
              )
            | 11 -> (
                match String.unsafe_get s pos with
                  | 'b' -> (
                      if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'e' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | 'u' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'e' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 12 -> (
                match String.unsafe_get s pos with
                  | 'b' -> (
                      if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'v' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'd' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | 'u' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'v' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'd' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 13 -> (
                match String.unsafe_get s pos with
                  | 'b' -> (
                      if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'v' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'l' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'b' && String.unsafe_get s (pos+11) = 'l' && String.unsafe_get s (pos+12) = 'e' then (
                        5
                      )
                      else (
                        -1
                      )
                    )
                  | 'u' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'v' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'l' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'b' && String.unsafe_get s (pos+11) = 'l' && String.unsafe_get s (pos+12) = 'e' then (
                        4
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | 3 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            bits0 := !bits0 lor 0x8;
          | 4 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 4 (Obj.repr v);
            bits0 := !bits0 lor 0x10;
          | 5 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 5 (Obj.repr v);
            bits0 := !bits0 lor 0x20;
          | 6 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 6 (Obj.repr v);
            bits0 := !bits0 lor 0x40;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'e' then (
                    6
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  match String.unsafe_get s pos with
                    | 'b' -> (
                        if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'e' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | 'u' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'b' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'e' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 12 -> (
                  match String.unsafe_get s pos with
                    | 'b' -> (
                        if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'v' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'd' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 'u' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'v' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'd' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 13 -> (
                  match String.unsafe_get s pos with
                    | 'b' -> (
                        if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'v' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'l' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'b' && String.unsafe_get s (pos+11) = 'l' && String.unsafe_get s (pos+12) = 'e' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | 'u' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'v' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'l' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'b' && String.unsafe_get s (pos+11) = 'l' && String.unsafe_get s (pos+12) = 'e' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | 3 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              bits0 := !bits0 lor 0x8;
            | 4 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 4 (Obj.repr v);
              bits0 := !bits0 lor 0x10;
            | 5 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 5 (Obj.repr v);
              bits0 := !bits0 lor 0x20;
            | 6 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 6 (Obj.repr v);
              bits0 := !bits0 lor 0x40;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x7f then Ag_oj_run.missing_fields p [| !bits0 |] [| "usd_balance"; "btc_balance"; "usd_reserved"; "btc_reserved"; "usd_available"; "btc_available"; "fee" |];
        Ag_oj_run.identity x
      )
)
let balance_of_string s =
  read_balance (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_user_transaction = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"datetime\":";
    (
      Yojson.Safe.write_string
    )
      ob x.transaction_datetime;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.transaction_id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"type_\":";
    (
      Yojson.Safe.write_string
    )
      ob x.transaction_type_;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"usd\":";
    (
      Yojson.Safe.write_string
    )
      ob x.transaction_usd;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"btc\":";
    (
      Yojson.Safe.write_string
    )
      ob x.transaction_btc;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"fee\":";
    (
      Yojson.Safe.write_string
    )
      ob x.transaction_fee;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"order_id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.transaction_order_id;
    Bi_outbuf.add_char ob '}';
)
let string_of_user_transaction ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_user_transaction ob x;
  Bi_outbuf.contents ob
let read_user_transaction = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        transaction_datetime = Obj.magic 0.0;
        transaction_id = Obj.magic 0.0;
        transaction_type_ = Obj.magic 0.0;
        transaction_usd = Obj.magic 0.0;
        transaction_btc = Obj.magic 0.0;
        transaction_fee = Obj.magic 0.0;
        transaction_order_id = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                  1
                )
                else (
                  -1
                )
              )
            | 3 -> (
                match String.unsafe_get s pos with
                  | 'b' -> (
                      if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'c' then (
                        4
                      )
                      else (
                        -1
                      )
                    )
                  | 'f' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'e' then (
                        5
                      )
                      else (
                        -1
                      )
                    )
                  | 'u' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'd' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 5 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' then (
                  2
                )
                else (
                  -1
                )
              )
            | 8 -> (
                match String.unsafe_get s pos with
                  | 'd' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 'o' -> (
                      if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'd' then (
                        6
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | 3 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            bits0 := !bits0 lor 0x8;
          | 4 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 4 (Obj.repr v);
            bits0 := !bits0 lor 0x10;
          | 5 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 5 (Obj.repr v);
            bits0 := !bits0 lor 0x20;
          | 6 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 6 (Obj.repr v);
            bits0 := !bits0 lor 0x40;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 3 -> (
                  match String.unsafe_get s pos with
                    | 'b' -> (
                        if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'c' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | 'f' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'e' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | 'u' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'd' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  match String.unsafe_get s pos with
                    | 'd' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 'o' -> (
                        if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'd' then (
                          6
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | 3 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              bits0 := !bits0 lor 0x8;
            | 4 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 4 (Obj.repr v);
              bits0 := !bits0 lor 0x10;
            | 5 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 5 (Obj.repr v);
              bits0 := !bits0 lor 0x20;
            | 6 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 6 (Obj.repr v);
              bits0 := !bits0 lor 0x40;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x7f then Ag_oj_run.missing_fields p [| !bits0 |] [| "datetime"; "id"; "type_"; "usd"; "btc"; "fee"; "order_id" |];
        Ag_oj_run.identity x
      )
)
let user_transaction_of_string s =
  read_user_transaction (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__4 = (
  Ag_oj_run.write_list (
    write_user_transaction
  )
)
let string_of__4 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__4 ob x;
  Bi_outbuf.contents ob
let read__4 = (
  Ag_oj_run.read_list (
    read_user_transaction
  )
)
let _4_of_string s =
  read__4 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_user_transactions = (
  write__4
)
let string_of_user_transactions ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_user_transactions ob x;
  Bi_outbuf.contents ob
let read_user_transactions = (
  read__4
)
let user_transactions_of_string s =
  read_user_transactions (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_order = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.open_order_id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"datetime\":";
    (
      Yojson.Safe.write_string
    )
      ob x.open_order_datetime;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"type_\":";
    (
      Yojson.Safe.write_string
    )
      ob x.open_order_type_;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"price\":";
    (
      Yojson.Safe.write_string
    )
      ob x.open_order_price;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"amount\":";
    (
      Yojson.Safe.write_string
    )
      ob x.open_order_amount;
    Bi_outbuf.add_char ob '}';
)
let string_of_order ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_order ob x;
  Bi_outbuf.contents ob
let read_order = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        open_order_id = Obj.magic 0.0;
        open_order_datetime = Obj.magic 0.0;
        open_order_type_ = Obj.magic 0.0;
        open_order_price = Obj.magic 0.0;
        open_order_amount = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | 5 -> (
                match String.unsafe_get s pos with
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'e' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | 't' -> (
                      if String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' then (
                  4
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | 3 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            bits0 := !bits0 lor 0x8;
          | 4 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 4 (Obj.repr v);
            bits0 := !bits0 lor 0x10;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  match String.unsafe_get s pos with
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'e' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 't' -> (
                        if String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | 3 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              bits0 := !bits0 lor 0x8;
            | 4 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 4 (Obj.repr v);
              bits0 := !bits0 lor 0x10;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x1f then Ag_oj_run.missing_fields p [| !bits0 |] [| "id"; "datetime"; "type_"; "price"; "amount" |];
        Ag_oj_run.identity x
      )
)
let order_of_string s =
  read_order (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__5 = (
  Ag_oj_run.write_list (
    write_order
  )
)
let string_of__5 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__5 ob x;
  Bi_outbuf.contents ob
let read__5 = (
  Ag_oj_run.read_list (
    read_order
  )
)
let _5_of_string s =
  read__5 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_orders = (
  write__5
)
let string_of_orders ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_orders ob x;
  Bi_outbuf.contents ob
let read_orders = (
  read__5
)
let orders_of_string s =
  read_orders (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_code = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"usd\":";
    (
      Yojson.Safe.write_string
    )
      ob x.code_usd;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"btc\":";
    (
      Yojson.Safe.write_string
    )
      ob x.code_btc;
    Bi_outbuf.add_char ob '}';
)
let string_of_code ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_code ob x;
  Bi_outbuf.contents ob
let read_code = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        code_usd = Obj.magic 0.0;
        code_btc = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 3 then (
            match String.unsafe_get s pos with
              | 'b' -> (
                  if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'c' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 'u' -> (
                  if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
          )
          else (
            -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            if len = 3 then (
              match String.unsafe_get s pos with
                | 'b' -> (
                    if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'c' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 'u' -> (
                    if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields p [| !bits0 |] [| "usd"; "btc" |];
        Ag_oj_run.identity x
      )
)
let code_of_string s =
  read_code (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_withdrawal = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.withdrawal_id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"datetime\":";
    (
      Yojson.Safe.write_string
    )
      ob x.withdrawal_datetime;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"type_\":";
    (
      Yojson.Safe.write_int
    )
      ob x.withdrawal_type_;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"amount\":";
    (
      Yojson.Safe.write_string
    )
      ob x.withdrawal_amount;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"status\":";
    (
      Yojson.Safe.write_int
    )
      ob x.withdrawal_status;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"data\":";
    (
      Yojson.Safe.write_string
    )
      ob x.withdrawal_data;
    Bi_outbuf.add_char ob '}';
)
let string_of_withdrawal ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_withdrawal ob x;
  Bi_outbuf.contents ob
let read_withdrawal = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        withdrawal_id = Obj.magic 0.0;
        withdrawal_datetime = Obj.magic 0.0;
        withdrawal_type_ = Obj.magic 0.0;
        withdrawal_amount = Obj.magic 0.0;
        withdrawal_status = Obj.magic 0.0;
        withdrawal_data = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                  5
                )
                else (
                  -1
                )
              )
            | 5 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' then (
                  2
                )
                else (
                  -1
                )
              )
            | 6 -> (
                match String.unsafe_get s pos with
                  | 'a' -> (
                      if String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 's' then (
                        4
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                Ag_oj_run.read_int
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | 3 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            bits0 := !bits0 lor 0x8;
          | 4 ->
            let v =
              (
                Ag_oj_run.read_int
              ) p lb
            in
            Obj.set_field (Obj.repr x) 4 (Obj.repr v);
            bits0 := !bits0 lor 0x10;
          | 5 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 5 (Obj.repr v);
            bits0 := !bits0 lor 0x20;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                    5
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  match String.unsafe_get s pos with
                    | 'a' -> (
                        if String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 's' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  Ag_oj_run.read_int
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | 3 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              bits0 := !bits0 lor 0x8;
            | 4 ->
              let v =
                (
                  Ag_oj_run.read_int
                ) p lb
              in
              Obj.set_field (Obj.repr x) 4 (Obj.repr v);
              bits0 := !bits0 lor 0x10;
            | 5 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 5 (Obj.repr v);
              bits0 := !bits0 lor 0x20;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3f then Ag_oj_run.missing_fields p [| !bits0 |] [| "id"; "datetime"; "type_"; "amount"; "status"; "data" |];
        Ag_oj_run.identity x
      )
)
let withdrawal_of_string s =
  read_withdrawal (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__6 = (
  Ag_oj_run.write_list (
    write_withdrawal
  )
)
let string_of__6 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__6 ob x;
  Bi_outbuf.contents ob
let read__6 = (
  Ag_oj_run.read_list (
    read_withdrawal
  )
)
let _6_of_string s =
  read__6 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_withdrawal_requests = (
  write__6
)
let string_of_withdrawal_requests ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_withdrawal_requests ob x;
  Bi_outbuf.contents ob
let read_withdrawal_requests = (
  read__6
)
let withdrawal_requests_of_string s =
  read_withdrawal_requests (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_unconfirmed = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"amount\":";
    (
      Yojson.Safe.write_string
    )
      ob x.unconfirmed_amount;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"address\":";
    (
      Yojson.Safe.write_string
    )
      ob x.unconfirmed_address;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"confirmations\":";
    (
      Yojson.Safe.write_string
    )
      ob x.unconfirmed_confirmations;
    Bi_outbuf.add_char ob '}';
)
let string_of_unconfirmed ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_unconfirmed ob x;
  Bi_outbuf.contents ob
let read_unconfirmed = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        unconfirmed_amount = Obj.magic 0.0;
        unconfirmed_address = Obj.magic 0.0;
        unconfirmed_confirmations = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 6 -> (
                if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' then (
                  0
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'd' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'o' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 's' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 6 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'd' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'o' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x7 then Ag_oj_run.missing_fields p [| !bits0 |] [| "amount"; "address"; "confirmations" |];
        Ag_oj_run.identity x
      )
)
let unconfirmed_of_string s =
  read_unconfirmed (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__7 = (
  Ag_oj_run.write_list (
    write_unconfirmed
  )
)
let string_of__7 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__7 ob x;
  Bi_outbuf.contents ob
let read__7 = (
  Ag_oj_run.read_list (
    read_unconfirmed
  )
)
let _7_of_string s =
  read__7 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_unconfirmeds = (
  write__7
)
let string_of_unconfirmeds ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_unconfirmeds ob x;
  Bi_outbuf.contents ob
let read_unconfirmeds = (
  read__7
)
let unconfirmeds_of_string s =
  read_unconfirmeds (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
