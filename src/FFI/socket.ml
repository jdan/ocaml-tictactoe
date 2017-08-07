open Express

module Socket = struct
  type socket
  external on : socket -> string -> ('a -> unit) -> unit = "on" [@@bs.send]
end

module IO = struct
  type server
  external attach : HTTP.server -> server = "socket.io" [@@bs.module]
  external on : server -> string -> (Socket.socket -> unit) -> unit = "on" [@@bs.send]
end

