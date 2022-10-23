(lang dune 3.4)

(generate_opam_files true)

(name fetch)
(version c4a0689-dirty)

(package
 (name fetch-core)
 (synopsis "")
 (description "")
 (depends)
 (tags
  (topics "to describe" your project)))

(package
 (name fetch-eio)
 (synopsis "")
 (description "")
 (depends fetch-core cohttp cohttp-eio eio_main)
 (tags
  (topics "to describe" your project)))
