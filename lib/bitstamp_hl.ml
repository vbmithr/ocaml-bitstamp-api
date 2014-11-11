open Lwt
open Types

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
        List.map (fun t -> HLTransaction.{ tid=t.Bitstamp_t.transaction_tid;
                             datetime=float_of_string t.Bitstamp_t.transaction_date;
                             price=float_of_string t.Bitstamp_t.transaction_price;
                             amount=float_of_string t.Bitstamp_t.transaction_amount }) ts
        |> List.iter (fun t -> write_untagged_transaction ob t)
        |> fun () -> inner (offset + limit)
    | `Error s -> failwith s
  in
  try%lwt
    inner 0
  with exn ->
    Lwt_log.error_f ~exn "Failed to get all bitstamp transactions"
  [%finally
    Bi_outbuf.flush_channel_writer ob;
    close_out oc;
    Lwt.return_unit]

