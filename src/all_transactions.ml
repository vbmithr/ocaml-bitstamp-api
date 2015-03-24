open Lwt
module B = Bitstamp.API(Bitstamp_lwt)
open B

let all_bitstamp_transactions ?(waitfor=1.) ?(offset=0) ?(limit=1000) oc =
  let rec inner offset =
    Lwt_log.notice_f "offset = %d" offset >>= fun () ->
    Lwt_unix.sleep waitfor >>= fun () ->
    Transaction.transactions ~offset ~limit () >>= function
    | [] -> fail End_of_file
    | ts -> inner (offset + limit)
  in
  (try%lwt inner 0 with
   | End_of_file -> Lwt.return_unit
   | exn -> Lwt_log.error_f ~exn "Failed to get all bitstamp transactions")
    [%finally close_out oc; Lwt.return_unit]

let main () =
  Sys.catch_break true;
  if Array.length Sys.argv < 2 then
    (Printf.eprintf "Usage: %s <output_file>\n" Sys.argv.(0); exit 1)
  else
    let oc = open_out Sys.argv.(1) in
    try
      all_bitstamp_transactions oc
    with Sys.Break -> close_out oc; Lwt.return_unit

let () = Lwt_main.run @@ main ()
