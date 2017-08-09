open Express

type cookie_session
external cookie_session : < name:string ; keys:string list > Js.t -> 'a
  = "cookie-session" [@@bs.module]

type session
external for_ : req -> session = "session" [@@bs.get]
external get : session -> string -> 'a Js.undefined = "" [@@bs.get_index]
external set : session -> string -> 'a -> unit = "" [@@bs.set_index]
