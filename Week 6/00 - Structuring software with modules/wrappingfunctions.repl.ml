let int x = EInt x

let mul a b =
  match a, b with
  | EInt 0, _ | _, EInt 0 -> EInt 0
  | EInt 1, e | e, EInt 1 -> e
  | a, b -> EMul (a, b)

let add a b =
  match a, b with
  | EInt 0, e | e, EInt 0 -> e
  | a, b -> EAdd (a, b)

let rec eval = function
  | EInt x -> x
  | EAdd (l, r) -> eval l + eval r
  | EMul (l, r) -> eval l * eval r

let example x y z = (* don't change anything to this defintion *)
  Exp.int (Exp.eval (Exp.mul (Exp.int x) (Exp.add (Exp.int y) (Exp.int z))))