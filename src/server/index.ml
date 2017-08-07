open Types

let app = express ();;

get app "/" (fun _ -> fun res ->
  Template.layout "index" "Hello, world!" |> send res
);;

let port = 3000;;
listen app port;;
Js.log ("Server listening on port " ^ string_of_int(port) ^ "...")
