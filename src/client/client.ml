open Socket

let () =
  let socket = Socket.create () in

  Socket.on socket "sup" (fun data -> Js.log data);
  Socket.emit socket "hello" [%bs.obj {
    from = "client" ;
  }]
