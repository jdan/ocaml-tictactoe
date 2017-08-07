type req

type res
external send : res -> string -> unit = "send" [@@bs.send]

type server
external get : server -> string -> (req -> res -> unit) -> unit = "get" [@@bs.send]
external post : server -> string -> (req -> res -> unit) -> unit = "post" [@@bs.send]

external listen : server -> int -> unit = "listen" [@@bs.send]
external express : unit -> server = "express" [@@bs.module]

let app = express ();;
let port = 3000;;

get app "/" (fun _ -> fun res ->
  send res (Template.layout "index" "Hello, world!")
);;

listen app port;;
Js.log ("Server listening on port " ^ string_of_int(port) ^ "...")
