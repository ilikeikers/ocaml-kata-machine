
type 'a tree =
  | Leaf
  | Node of 'a node

and 'a node = {
  value: 'a;
  left: 'a tree;
  right: 'a tree
}

include Tree_ds

(** [preorder_traversal_lin] is more efficient, but it reads much less clearly.
    Efficiency: O(n) *)
let preorder_traversal_lin tree =
    let rec pre_aux acc = function
        | Leaf -> acc
        | Node {value ; left ; right } -> [value] :: (pre_aux (pre_aux acc right) left)
    in pre_aux [] tree

(** [preorder_traversal] is less efficient, but it reads much more clearly.
    Efficiency: O(n^2) *)
let preorder_traversal tree =
    let rec pre_aux = function
    | Leaf -> []
    | Node {value ; left ; right } -> [value] @ pre_aux left @ pre_aux right
    in pre_aux tree
