type square = X | O | Empty
type board = square * square * square *
             square * square * square *
             square * square * square

type ('a, 'b) either = Left of 'a | Right of 'b

let empty : board = (Empty, Empty, Empty, Empty, Empty, Empty, Empty, Empty, Empty)

let make_move ((s1, s2, s3, s4, s5, s6, s7, s8, s9) : board) slot c' : (board, string) either =
  match slot with
  | 1 when s1 = Empty -> Left (c', s2, s3, s4, s5, s6, s7, s8, s9)
  | 2 when s2 = Empty -> Left (s1, c', s3, s4, s5, s6, s7, s8, s9)
  | 3 when s3 = Empty -> Left (s1, s2, c', s4, s5, s6, s7, s8, s9)
  | 4 when s4 = Empty -> Left (s1, s2, s3, c', s5, s6, s7, s8, s9)
  | 5 when s5 = Empty -> Left (s1, s2, s3, s4, c', s6, s7, s8, s9)
  | 6 when s6 = Empty -> Left (s1, s2, s3, s4, s5, c', s7, s8, s9)
  | 7 when s7 = Empty -> Left (s1, s2, s3, s4, s5, s6, c', s8, s9)
  | 8 when s8 = Empty -> Left (s1, s2, s3, s4, s5, s6, s7, c', s9)
  | 9 when s9 = Empty -> Left (s1, s2, s3, s4, s5, s6, s7, s8, c')
  | _ -> if slot < 1 || slot > 9
          then Right "Invalid space specified"
          else Right "Space is occupied"

let winner (board : board) = match board with
| (a, b, c, _, _, _, _, _, _) when a = b && b = c -> Some a
| (_, _, _, a, b, c, _, _, _) when a = b && b = c -> Some a
| (_, _, _, _, _, _, a, b, c) when a = b && b = c -> Some a
| (a, _, _, b, _, _, c, _, _) when a = b && b = c -> Some a
| (_, a, _, _, b, _, _, c, _) when a = b && b = c -> Some a
| (_, _, a, _, _, b, _, _, c) when a = b && b = c -> Some a
| (a, _, _, _, b, _, _, _, c) when a = b && b = c -> Some a
| (_, _, a, _, b, _, c, _, _) when a = b && b = c -> Some a
| _ -> None

let string_of_square = function
| X -> "X"
| O -> "O"
| Empty -> " "

let square_of_char = function
| 'X' -> X
| 'O' -> O
| _ -> Empty

let string_of_board ((s1, s2, s3, s4, s5, s6, s7, s8, s9) : board) =
  List.fold_left
    (fun acc -> fun square -> acc ^ string_of_square square)
    ""
    [s1; s2; s3; s4; s5; s6; s7; s8; s9]

let board_of_string str : board = (
  square_of_char str.[0],
  square_of_char str.[1],
  square_of_char str.[2],
  square_of_char str.[3],
  square_of_char str.[4],
  square_of_char str.[5],
  square_of_char str.[6],
  square_of_char str.[7],
  square_of_char str.[8]
)
