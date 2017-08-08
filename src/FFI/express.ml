type req

type res
external send : res -> string -> unit = "send" [@@bs.send]

type app
external use : app -> 'a -> app = "use" [@@bs.send]
external get : app -> string -> (req -> res -> unit) -> app
  = "get" [@@bs.send]
external post : app -> string -> (req -> res -> unit) -> app
  = "post" [@@bs.send]

external express : unit -> app = "express" [@@bs.module]
external express_static : string -> 'a = "static" [@@bs.module "express"]

module HTTP = struct
  type server
  external make_server : app -> server = "Server" [@@bs.module "http"]
end

external listen : HTTP.server -> int -> (unit -> unit) -> HTTP.server = "listen" [@@bs.send]
