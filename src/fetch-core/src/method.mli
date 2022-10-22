type standard =
  [ `CONNECT | `DELETE | `GET | `HEAD | `OPTIONS | `POST | `PUT | `TRACE ]

type t =
  [ `CONNECT
  | `DELETE
  | `GET
  | `HEAD
  | `OPTIONS
  | `Other of string
  | `POST
  | `PUT
  | `TRACE ]

val of_string :
  string ->
  [> `CONNECT
  | `DELETE
  | `GET
  | `HEAD
  | `OPTIONS
  | `Other of string
  | `POST
  | `PUT
  | `TRACE ]

val to_string :
  [< `CONNECT
  | `DELETE
  | `GET
  | `HEAD
  | `OPTIONS
  | `Other of string
  | `POST
  | `PUT
  | `TRACE ] ->
  string
