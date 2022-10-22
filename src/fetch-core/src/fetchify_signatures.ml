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

  module Status : module type of Status
  module Headers : module type of Headers
  module Request : module type of Request
  module Method : module type of Method

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