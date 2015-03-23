#!/usr/bin/env ocaml
#directory "pkg"
#use "topkg.ml"

let () =
  Pkg.describe "bitstamp" ~builder:`OCamlbuild [
    Pkg.lib "pkg/META";
    Pkg.lib ~exts:Exts.module_library "lib/bitstamp";
    Pkg.lib ~exts:Exts.library "top/bitstamp_top";
    Pkg.lib ~exts:Exts.module_library "lib/bitstamp_lwt";
  ]
