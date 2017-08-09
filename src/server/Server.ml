open Express
open Socket
open Browserify

let app = express ()
let http_server = HTTP.make_server app
let io = IO.attach http_server

let get_visits req =
  let session = Session.for_ req in
  match Session.get session "visits" |> Js.Undefined.to_opt with
  | None -> 0
  | Some value -> value

let incr_visits req =
  let session = Session.for_ req in
    Session.set session "visits" (1 + get_visits req)

let pluralize count singular plural =
  if count = 1 then singular
  else plural

let () =
  use app (Session.cookie_session [%bs.obj {
    name = "ocaml-talk" ;
    keys = [ "secret" ] ;
  }]);

  get app "/" (fun req -> fun res ->
    (* Increment our visits session variable *)
    incr_visits req;

    let num_visits = get_visits req in
    let str_visits = string_of_int num_visits in
    let times = pluralize num_visits "1 time" (str_visits ^ " times") in
      Template.layout
        "Greetings!"
        ("<h1>You have visited " ^ times ^ "!</h1>")
      |> send res
  );

  get app "/client.js" (fun _ -> fun res ->
    let b = browserify () in
    add b "lib/js/src/client/client.js";
    pipe (bundle b) res
  );

  IO.on io "connection" (fun socket ->
    (* quick game of ping pong *)
    Socket.on socket "hello" (fun msg ->
      Js.log msg;
      Socket.emit socket "sup" [%bs.obj {
        from = "server"
      }])
  );

  let port = 3000 in
  listen http_server port (fun _ ->
    Js.log ("Server listening on port " ^ string_of_int(port) ^ "...")
  )
