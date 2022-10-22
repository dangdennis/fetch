module Fetch_implementation = struct
  module Headers = Fetch_core.Headers
  module Method = Fetch_core.Method
  module Status = Fetch_core.Status
  module Request = Fetch_core.Request

  exception InvalidRequest of string

  module Body = struct
    type t = string

    let make body = body
    let to_string body = body
    let of_string body = make body
  end

  module Response = struct
    module Body = Body
    module Status = Status

    type t = {
      body : Body.t;
      headers : Headers.t list;
      status : Status.t;
      url : string;
    }

    let make ~body ~headers ~status ~url = { body; headers; status; url }

    let fetch ?body ?(headers = []) ?(meth = `GET) url =
      let { Fetch_core.Request.headers; body; meth; url } =
        Fetch_core.Request.create ~body ~headers ~meth url
      in

      let body =
        match body with
        | Some body -> Cohttp_eio.Body.Fixed body
        | None -> Cohttp_eio.Body.Empty
      in

      let headers = Http.Header.of_list headers in

      Eio_main.run @@ fun env ->
      Eio.Switch.run @@ fun sw ->
      let uri = Uri.of_string url in
      let port =
        match Uri.port uri with
        | Some port -> port
        | None -> (
            match Uri.scheme uri with
            | None -> raise (InvalidRequest "scheme is missing")
            | Some scheme -> (
                match scheme with
                | "https" -> 443
                | "http" -> 40
                | s ->
                    raise
                      (InvalidRequest (Format.sprintf "%s is not supported" s)))
            )
      in
      let hostname = Uri.host_with_default ~default:"localhost" uri in
      let he = Unix.gethostbyname hostname in
      let addr = `Tcp (Eio_unix.Ipaddr.of_unix he.h_addr_list.(0), port) in
      let conn = Eio.Net.connect ~sw env#net addr in
      let res =
        Cohttp_eio.Client.call ~meth ~conn ~headers ~body (hostname, Some port)
          "/"
      in
      Cohttp_eio.Client.read_fixed res
  end
end

include Fetch_core.Fetchify.Create_fetch_implementation (Fetch_implementation)
