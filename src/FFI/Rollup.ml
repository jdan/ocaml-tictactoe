type thenable
external rollup : < entry:string > Js.t -> thenable = "rollup" [@@bs.module "rollup"]
external then_ : thenable -> ('a -> 'b) -> 'c = "then" [@@bs.send]

type bundle
external generate : bundle -> < format:string ; moduleName:string > Js.t -> thenable = "generate" [@@bs.send]

type result
external code : result -> string = "code" [@@bs.get]

(* Most likely does not belong in FFI *)
let bundle entry res =
  let bundlePromise = rollup [%bs.obj { entry = entry }] in
  let generatePromise =
    then_ bundlePromise
          (fun bundle -> generate bundle [%bs.obj {
            format = "iife" ; moduleName = "client"
          }])
  in then_ generatePromise (fun result -> code result |> Express.send res)
