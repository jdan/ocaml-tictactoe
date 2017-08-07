type req

type res
external send : res -> string -> unit = "send" [@@bs.send]

type server
external get : server -> string -> (req -> res -> unit) -> unit = "get" [@@bs.send]
external post : server -> string -> (req -> res -> unit) -> unit = "post" [@@bs.send]

external listen : server -> int -> unit = "listen" [@@bs.send]
external express : unit -> server = "express" [@@bs.module]
