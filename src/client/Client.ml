open Socket

let () =
  match (TicTacToe.make_move TicTacToe.empty 1 TicTacToe.X) with
  | Left board -> TicTacToe.string_of_board board |> Js.log
  | _ -> Js.log "whoops";

  let socket = Socket.create () in

  Socket.on socket "sup" (fun data -> Js.log data);
  Socket.emit socket "hello" [%bs.obj {
    from = "client" ;
  }]
