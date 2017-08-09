open Express

module Socket = struct
  type socket
  external create : unit -> socket = "io" [@@bs.val]
  external on : socket -> string -> ('a -> unit) -> unit = "on" [@@bs.send]
  external emit : socket -> string -> 'a -> unit = "emit" [@@bs.send]
end

module IO = struct
  type server
  external attach : HTTP.server -> server = "socket.io" [@@bs.module]
  external on : server -> string -> (Socket.socket -> unit) -> unit = "on" [@@bs.send]
end
