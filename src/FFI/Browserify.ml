open Express
type browserify
type pipeable

external browserify : unit -> browserify = "browserify" [@@bs.module]
external add : browserify -> string -> unit = "add" [@@bs.send]
external bundle : browserify -> pipeable = "bundle" [@@bs.send]

external pipe : pipeable -> res -> unit = "pipe" [@@bs.send]
