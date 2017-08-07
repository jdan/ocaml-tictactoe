type req

type res
external send : res -> string -> unit = "send" [@@bs.send]

type server
external use : server -> 'a -> server = "use" [@@bs.send]
external get : server -> string -> (req -> res -> unit) -> server
  = "get" [@@bs.send]
external post : server -> string -> (req -> res -> unit) -> server
  = "post" [@@bs.send]

external listen : server -> int -> server = "listen" [@@bs.send]
external express : unit -> server = "express" [@@bs.module]
