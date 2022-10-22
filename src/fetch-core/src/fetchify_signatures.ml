module type FETCH = sig
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
    ?body:
      (* ?env:'a ->
         ?sw:'b -> *)
      string ->
    ?headers:Headers.t list ->
    ?meth:Method.t ->
    string ->
    'a
end
