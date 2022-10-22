(lang dune 2.0)

(generate_opam_files true)

(name fetch)

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
