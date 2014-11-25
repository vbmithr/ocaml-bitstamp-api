let main () =
  Sys.catch_break true;
    if Array.length Sys.argv < 2 then
      (Printf.eprintf "Usage: %s <output_file>\n" Sys.argv.(0); exit 1)
    else
      let oc = open_out Sys.argv.(1) in
      try
        Bitstamp.HL.all_bitstamp_transactions oc
      with Sys.Break -> close_out oc; Lwt.return_unit

let () = Lwt_main.run @@ main ()
