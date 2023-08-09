let rec sum = function
  | [] -> 0
  | x :: xs -> x + sum xs
;;

let _ = sum [ 1; 2 ]
