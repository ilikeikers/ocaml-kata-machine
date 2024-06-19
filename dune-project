(lang dune 3.10)

(name ocamlalgos)

(generate_opam_files true)

(source
 (github ilikeikers/ocaml-kata-machine))

(authors "Ike Patton")

(maintainers "Ike Patton")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name ocamlalgos)
 (allow_empty)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml dune ounit2 ocamlformat ocamlformat-rpc utop odoc)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
