type req

type res
external send : res -> string -> unit = "send" [@@bs.send]
external set : res -> string -> string -> unit = "set" [@@bs.send]

type app
external use : app -> 'a -> unit = "use" [@@bs.send]
external get : app -> string -> (req -> res -> unit) -> unit
  = "get" [@@bs.send]
external post : app -> string -> (req -> res -> unit) -> unit
  = "post" [@@bs.send]

external express : unit -> app = "express" [@@bs.module]
external express_static : string -> 'a = "static" [@@bs.module "express"]

module HTTP = struct
  type server
  external make_server : app -> server = "Server" [@@bs.module "http"]
end

external listen : HTTP.server -> int -> (unit -> unit) -> unit = "listen" [@@bs.send]
