open Socket

let main () =
  match (TicTacToe.make_move TicTacToe.empty 3 TicTacToe.X) with
  | Left board -> TicTacToe.string_of_board board |> Js.log
  | Right error -> Js.log2 "Error: " error;

  let socket = Socket.create () in

  Socket.on socket "sup" (fun data -> Js.log data);
  Socket.emit socket "hello" [%bs.obj {
    from = "client" ;
  }]
