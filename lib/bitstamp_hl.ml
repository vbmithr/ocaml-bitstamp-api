open Bitstamp_hl_t
open Bitstamp_hl_b

let (>>=) = Lwt.(>>=)
let (>|=) = Lwt.(>|=)

let finally_do thunk final =
  try
    let r = thunk () in final (); r
  with exn ->
    final (); raise exn

module TransactionSet = Set.Make(
  struct
    type t = transaction
    let compare a b = compare a.tid b.tid
  end)

let read_transactions filename =
  let ic = open_in filename in
  let bic = Bi_inbuf.from_channel ic in
  let reader = Bitstamp_hl_b.get_transaction_reader transaction_tag in
  let trs = ref [] in
  finally_do
    (fun () ->
       try
         while true do
           trs := (reader bic)::!trs
         done; TransactionSet.empty
       with End_of_file ->
         List.fold_left (fun s t -> TransactionSet.add t s) TransactionSet.empty !trs
    )
    (fun () -> close_in ic)

let all_bitstamp_transactions
    ?(oc=open_out "/dev/null")
    ?(waitfor=1.)
    ?(offset=0)
    ?(limit=1000)
    () =
  let ob = Bi_outbuf.create_channel_writer oc in
  let rec inner offset =
    Lwt_log.notice_f "offset = %d" offset >>= fun () ->
    Lwt_unix.sleep waitfor >>= fun () ->
    Bitstamp.transactions ~offset ~limit () >>= function
    | `Ok ts ->
      if ts = [] then raise End_of_file
      else
        List.map (fun t -> { tid=t.Bitstamp_t.transaction_tid;
                             datetime=float_of_string t.Bitstamp_t.transaction_date;
                             price=float_of_string t.Bitstamp_t.transaction_price;
                             amount=float_of_string t.Bitstamp_t.transaction_amount }) ts
        |> List.iter (fun t -> write_untagged_transaction ob t)
        |> fun () -> inner (offset + limit)
    | `Error s -> raise (Failure "Call to bitstamp failed")
  in
  try_lwt
    inner 0
  with exn ->
    Lwt_log.error_f ~exn "Failed to get all bitstamp transactions"
  finally
    Bi_outbuf.flush_channel_writer ob;
    close_out oc;
    Lwt.return ()

