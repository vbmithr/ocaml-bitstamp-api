(* Auto-generated from "bitstamp_hl.atd" *)


type transaction = Bitstamp_hl_t.transaction = {
  tid: int;
  datetime: float;
  price: float;
  amount: float
}


let transaction_tag = Bi_io.record_tag
let write_untagged_transaction = (
  fun ob x ->
    Bi_vint.write_uvint ob 4;
    Bi_outbuf.add_char4 ob '\128' 'X' 'a' 'O';
    (
      Bi_io.write_svint
    ) ob x.tid;
    Bi_outbuf.add_char4 ob '\239' '1' '\209' ';';
    (
      Bi_io.write_float64
    ) ob x.datetime;
    Bi_outbuf.add_char4 ob '\200' '\139' 'N' '\137';
    (
      Bi_io.write_float64
    ) ob x.price;
    Bi_outbuf.add_char4 ob '\213' '\003' '\017' '\216';
    (
      Bi_io.write_float64
    ) ob x.amount;
)
let write_transaction ob x =
  Bi_io.write_tag ob Bi_io.record_tag;
  write_untagged_transaction ob x
let string_of_transaction ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_transaction ob x;
  Bi_outbuf.contents ob
let get_transaction_reader = (
  fun tag ->
    if tag <> 21 then Ag_ob_run.read_error () else
      fun ib ->
        let x =
          {
            tid = Obj.magic 0.0;
            datetime = Obj.magic 0.0;
            price = Obj.magic 0.0;
            amount = Obj.magic 0.0;
          }
        in
        let bits0 = ref 0 in
        let len = Bi_vint.read_uvint ib in
        for i = 1 to len do
          match Bi_io.read_field_hashtag ib with
            | 5792079 ->
              let v =
                (
                  Ag_ob_run.read_int
                ) ib
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | -281947845 ->
              let v =
                (
                  Ag_ob_run.read_float64
                ) ib
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | -930394487 ->
              let v =
                (
                  Ag_ob_run.read_float64
                ) ib
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | -721219112 ->
              let v =
                (
                  Ag_ob_run.read_float64
                ) ib
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              bits0 := !bits0 lor 0x8;
            | _ -> Bi_io.skip ib
        done;
        if !bits0 <> 0xf then Ag_ob_run.missing_fields [| !bits0 |] [| "tid"; "datetime"; "price"; "amount" |];
        Ag_ob_run.identity x
)
let read_transaction = (
  fun ib ->
    if Bi_io.read_tag ib <> 21 then Ag_ob_run.read_error_at ib;
    let x =
      {
        tid = Obj.magic 0.0;
        datetime = Obj.magic 0.0;
        price = Obj.magic 0.0;
        amount = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    let len = Bi_vint.read_uvint ib in
    for i = 1 to len do
      match Bi_io.read_field_hashtag ib with
        | 5792079 ->
          let v =
            (
              Ag_ob_run.read_int
            ) ib
          in
          Obj.set_field (Obj.repr x) 0 (Obj.repr v);
          bits0 := !bits0 lor 0x1;
        | -281947845 ->
          let v =
            (
              Ag_ob_run.read_float64
            ) ib
          in
          Obj.set_field (Obj.repr x) 1 (Obj.repr v);
          bits0 := !bits0 lor 0x2;
        | -930394487 ->
          let v =
            (
              Ag_ob_run.read_float64
            ) ib
          in
          Obj.set_field (Obj.repr x) 2 (Obj.repr v);
          bits0 := !bits0 lor 0x4;
        | -721219112 ->
          let v =
            (
              Ag_ob_run.read_float64
            ) ib
          in
          Obj.set_field (Obj.repr x) 3 (Obj.repr v);
          bits0 := !bits0 lor 0x8;
        | _ -> Bi_io.skip ib
    done;
    if !bits0 <> 0xf then Ag_ob_run.missing_fields [| !bits0 |] [| "tid"; "datetime"; "price"; "amount" |];
    Ag_ob_run.identity x
)
let transaction_of_string ?pos s =
  read_transaction (Bi_inbuf.from_string ?pos s)
