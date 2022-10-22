module type FETCH = sig
  type 'a promise

  module Body : sig
    type t

    val to_string : t -> string
    val of_string : string -> t
  end

  module Response : sig
    module Body = Body
    module Status = Status

    type t = {
      body : Body.t;
      headers : Headers.t list;
      status : Status.t;
      url : string;
    }
  end

  val fetch :
    ?body:string ->
    ?headers:Headers.t list ->
    ?meth:Method.t ->
    string ->
    (Response.t, string) result promise
end

module type FETCHIFIED = sig
  type 'a promise

  module Status : sig
    type informational = [ `Continue | `Processing | `SwitchingProtocols ]

    type success =
      [ `Accepted
      | `AlreadyReported
      | `Created
      | `IMUsed
      | `MultiStatus
      | `NoContent
      | `NonAuthoritativeInformation
      | `OK
      | `PartialContent
      | `ResetContent ]

    type redirection =
      [ `Found
      | `MovedPermanently
      | `MultipleChoices
      | `NotModified
      | `PermanentRedirect
      | `SeeOther
      | `TemporaryRedirect
      | `UseProxy ]

    type client_error =
      [ `BadRequest
      | `Conflict
      | `ExpectationFailed
      | `FailedDependency
      | `Forbidden
      | `Gone
      | `ImATeapot
      | `LengthRequired
      | `Locked
      | `MethodNotAllowed
      | `MisdirectedRequest
      | `NotAcceptable
      | `NotFound
      | `PayloadTooLarge
      | `PaymentRequired
      | `PreconditionFailed
      | `PreconditionRequired
      | `ProxyAuthenticationRequired
      | `RangeNotSatisfiable
      | `RequestHeaderFieldsTooLarge
      | `RequestTimeout
      | `TooManyRequests
      | `Unauthorized
      | `UnavailableForLegalReasons
      | `UnprocessableEntity
      | `UnsupportedMediaType
      | `UpgradeRequired
      | `UriTooLong ]

    type server_error =
      [ `BadGateway
      | `GatewayTimeout
      | `HttpVersionNotSupported
      | `InsufficientStorage
      | `InternalServerError
      | `LoopDetected
      | `NetworkAuthenticationRequired
      | `NotExtended
      | `NotImplemented
      | `ServiceUnavailable
      | `VariantAlsoNegotiates ]

    type standard =
      [ `ClientError | `Informational | `Redirection | `ServerError | `Success ]

    type t =
      [ `ClientError
      | `Informational
      | `Other of int
      | `Redirection
      | `ServerError
      | `Success ]

    val to_code :
      [< `Accepted
      | `AlreadyReported
      | `BadGateway
      | `BadRequest
      | `Conflict
      | `Continue
      | `Created
      | `ExpectationFailed
      | `FailedDependency
      | `Forbidden
      | `Found
      | `GatewayTimeout
      | `Gone
      | `HttpVersionNotSupported
      | `IMUsed
      | `ImATeapot
      | `InsufficientStorage
      | `InternalServerError
      | `LengthRequired
      | `Locked
      | `LoopDetected
      | `MethodNotAllowed
      | `MisdirectedRequest
      | `MovedPermanently
      | `MultiStatus
      | `MultipleChoices
      | `NetworkAuthenticationRequired
      | `NoContent
      | `NonAuthoritativeInformation
      | `NotAcceptable
      | `NotExtended
      | `NotFound
      | `NotImplemented
      | `NotModified
      | `OK
      | `Other of int
      | `PartialContent
      | `PayloadTooLarge
      | `PaymentRequired
      | `PermanentRedirect
      | `PreconditionFailed
      | `PreconditionRequired
      | `Processing
      | `ProxyAuthenticationRequired
      | `RangeNotSatisfiable
      | `RequestHeaderFieldsTooLarge
      | `RequestTimeout
      | `ResetContent
      | `SeeOther
      | `ServiceUnavailable
      | `SwitchingProtocols
      | `TemporaryRedirect
      | `TooManyRequests
      | `Unauthorized
      | `UnavailableForLegalReasons
      | `UnprocessableEntity
      | `UnsupportedMediaType
      | `UpgradeRequired
      | `UriTooLong
      | `UseProxy
      | `VariantAlsoNegotiates ] ->
      int

    val of_code :
      int ->
      [> `Accepted
      | `AlreadyReported
      | `BadGateway
      | `BadRequest
      | `Conflict
      | `Continue
      | `Created
      | `ExpectationFailed
      | `FailedDependency
      | `Forbidden
      | `Found
      | `GatewayTimeout
      | `Gone
      | `HttpVersionNotSupported
      | `IMUsed
      | `ImATeapot
      | `InsufficientStorage
      | `InternalServerError
      | `LengthRequired
      | `Locked
      | `LoopDetected
      | `MethodNotAllowed
      | `MisdirectedRequest
      | `MovedPermanently
      | `MultiStatus
      | `MultipleChoices
      | `NetworkAuthenticationRequired
      | `NoContent
      | `NonAuthoritativeInformation
      | `NotAcceptable
      | `NotExtended
      | `NotFound
      | `NotImplemented
      | `NotModified
      | `OK
      | `Other of int
      | `PartialContent
      | `PayloadTooLarge
      | `PaymentRequired
      | `PermanentRedirect
      | `PreconditionFailed
      | `PreconditionRequired
      | `Processing
      | `ProxyAuthenticationRequired
      | `RangeNotSatisfiable
      | `RequestHeaderFieldsTooLarge
      | `RequestTimeout
      | `ResetContent
      | `SeeOther
      | `ServiceUnavailable
      | `SwitchingProtocols
      | `TemporaryRedirect
      | `TooManyRequests
      | `Unauthorized
      | `UnavailableForLegalReasons
      | `UnprocessableEntity
      | `UnsupportedMediaType
      | `UpgradeRequired
      | `UriTooLong
      | `UseProxy
      | `VariantAlsoNegotiates ]

    val is_successful : [> success ] -> bool
    val is_redirect : [> redirection ] -> bool
    val is_client_error : [> client_error ] -> bool
    val is_server_error : [> server_error ] -> bool
    val is_informational : [> informational ] -> bool

    val is_error :
      [> `BadGateway
      | `BadRequest
      | `Conflict
      | `ExpectationFailed
      | `FailedDependency
      | `Forbidden
      | `GatewayTimeout
      | `Gone
      | `HttpVersionNotSupported
      | `ImATeapot
      | `InsufficientStorage
      | `InternalServerError
      | `LengthRequired
      | `Locked
      | `LoopDetected
      | `MethodNotAllowed
      | `MisdirectedRequest
      | `NetworkAuthenticationRequired
      | `NotAcceptable
      | `NotExtended
      | `NotFound
      | `NotImplemented
      | `PayloadTooLarge
      | `PaymentRequired
      | `PreconditionFailed
      | `PreconditionRequired
      | `ProxyAuthenticationRequired
      | `RangeNotSatisfiable
      | `RequestHeaderFieldsTooLarge
      | `RequestTimeout
      | `ServiceUnavailable
      | `TooManyRequests
      | `Unauthorized
      | `UnavailableForLegalReasons
      | `UnprocessableEntity
      | `UnsupportedMediaType
      | `UpgradeRequired
      | `UriTooLong
      | `VariantAlsoNegotiates ] ->
      bool

    val make :
      int ->
      [> `Accepted
      | `AlreadyReported
      | `BadGateway
      | `BadRequest
      | `Conflict
      | `Continue
      | `Created
      | `ExpectationFailed
      | `FailedDependency
      | `Forbidden
      | `Found
      | `GatewayTimeout
      | `Gone
      | `HttpVersionNotSupported
      | `IMUsed
      | `ImATeapot
      | `InsufficientStorage
      | `InternalServerError
      | `LengthRequired
      | `Locked
      | `LoopDetected
      | `MethodNotAllowed
      | `MisdirectedRequest
      | `MovedPermanently
      | `MultiStatus
      | `MultipleChoices
      | `NetworkAuthenticationRequired
      | `NoContent
      | `NonAuthoritativeInformation
      | `NotAcceptable
      | `NotExtended
      | `NotFound
      | `NotImplemented
      | `NotModified
      | `OK
      | `Other of int
      | `PartialContent
      | `PayloadTooLarge
      | `PaymentRequired
      | `PermanentRedirect
      | `PreconditionFailed
      | `PreconditionRequired
      | `Processing
      | `ProxyAuthenticationRequired
      | `RangeNotSatisfiable
      | `RequestHeaderFieldsTooLarge
      | `RequestTimeout
      | `ResetContent
      | `SeeOther
      | `ServiceUnavailable
      | `SwitchingProtocols
      | `TemporaryRedirect
      | `TooManyRequests
      | `Unauthorized
      | `UnavailableForLegalReasons
      | `UnprocessableEntity
      | `UnsupportedMediaType
      | `UpgradeRequired
      | `UriTooLong
      | `UseProxy
      | `VariantAlsoNegotiates ]
  end

  module Headers : sig
    type t = string * string

    val to_string : (string * string) list -> string
  end

  module Request : sig
    type t = Request.t = {
      body : string option;
      meth : Method.t;
      headers : Fetch_core__Headers.t list;
      url : string;
    }

    val create :
      body:string option ->
      headers:Fetch_core__Headers.t list ->
      ?meth:Method.t ->
      string ->
      t
  end

  module Method : sig
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
  end

  module Body : sig
    type t

    val of_string : string -> t
  end

  module Response : sig
    type t = {
      body : Body.t;
      headers : Headers.t list;
      status : Status.t;
      url : string;
    }
  end

  val fetch :
    ?body:string ->
    ?headers:Headers.t list ->
    ?meth:Method.t ->
    string ->
    (Response.t, string) result promise

  val get :
    ?body:string ->
    ?headers:Headers.t list ->
    string ->
    (Response.t, string) result promise

  val post :
    ?body:string ->
    ?headers:Headers.t list ->
    string ->
    (Response.t, string) result promise

  val put :
    ?body:string ->
    ?headers:Headers.t list ->
    string ->
    (Response.t, string) result promise

  val delete :
    ?body:string ->
    ?headers:Headers.t list ->
    string ->
    (Response.t, string) result promise
end
