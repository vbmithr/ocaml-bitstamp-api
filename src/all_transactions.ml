open Bitstamp_hl

let main () =
  if Array.length Sys.argv < 2 then
    (Printf.fprintf stderr "Usage: %s <output_file>\n" Sys.argv.(0);
     exit 1)
  else
    all_bitstamp_transactions ~oc:(open_out Sys.argv.(1)) ()

let () = Lwt_main.run (main ())
