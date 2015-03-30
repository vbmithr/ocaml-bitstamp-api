module B = Bitstamp.API(Bitstamp_lwt)

let printers = [
  "B.Ticker.pp";
  "B.Order_book.pp";
  "B.Transaction.pp";
  "B.Eur_usd.pp";
  "B.Balance.pp";
  "B.User_transaction.pp";
  "B.Order.pp";
  "B.Withdraw.pp";
  "B.Deposit.pp";
]

let eval_string
      ?(print_outcome = false) ?(err_formatter = Format.err_formatter) str =
  let lexbuf = Lexing.from_string str in
  let phrase = !Toploop.parse_toplevel_phrase lexbuf in
  Toploop.execute_phrase print_outcome err_formatter phrase

let rec install_printers = function
  | [] -> true
  | printer :: printers ->
      let cmd = Printf.sprintf "#install_printer %s;;" printer in
      eval_string cmd && install_printers printers

let () =
  if not (install_printers printers) then
    Format.eprintf "Problem installing Bitstamp-printers@."
