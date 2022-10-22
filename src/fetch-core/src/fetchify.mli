module type FETCH = Fetchify_signatures.FETCH
module type FETCHIFIED = Fetchify_signatures.FETCHIFIED

module CreateFetchImplementation : functor
  (F : sig
     type 'a promise

     module Body : sig
       type t

       val to_string : t -> string
       val of_string : string -> t
     end

     module Response : sig
       module Body : sig
         type t = Body.t

         val to_string : t -> string
         val of_string : string -> t
       end

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
   end)
  -> sig
  module Headers = Headers
  module Status = Status
  module Method = Method
  module Request = Request

  module Body : sig
    type t = F.Body.t

    val to_string : t -> string
    val of_string : string -> t
  end

  module Response : sig
    module Body : sig
      type t = Body.t

      val to_string : t -> string
      val of_string : string -> t
    end

    module Status = Status

    type t = F.Response.t = {
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
    (F.Response.t, string) result F.promise

  val get :
    ?body:string ->
    ?headers:Headers.t list ->
    string ->
    (F.Response.t, string) result F.promise

  val post :
    ?body:string ->
    ?headers:Headers.t list ->
    string ->
    (F.Response.t, string) result F.promise

  val put :
    ?body:string ->
    ?headers:Headers.t list ->
    string ->
    (F.Response.t, string) result F.promise

  val delete :
    ?body:string ->
    ?headers:Headers.t list ->
    string ->
    (F.Response.t, string) result F.promise
end
