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
