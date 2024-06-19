include Builtin_implementation.Tree_ds

type 'a tree =
      | Leaf
      | Node of 'a node
    and 'a node = {
      value: 'a;
      left: 'a tree;
      right: 'a tree
}

(** [gb_empty_tree] is an emty tree used to compare to empty list for binary tree traversal alogrithms *)
let gb_empty_tree = Leaf

(** [gb_empty_list] is a used to compare for binary tree traversal alogrithms *)
let gb_empty_list = []

(** [gb_single_node] is a tree with a single node used to compare to single list for binary tree traversal alogrithms *)
let gb_single_node =
    Node { value = 0; left = Leaf; right = Leaf}

(** [gb_single_list] is a singleton list used to compare to single node tree for binary tree traversal alogrithms *)
let gb_single_list = [0]

(** [gb_valid_one_deep] is a valid and sortedtree with a depth of one used to compare to [gb_one_deep_list] for binary tree traversal alogrithms *)
let gb_valid_one_deep =
    Node { value = 0
        ; left = Node {value = -1; left = Leaf; right = Leaf}
        ; right = Node {value = 1; left = Leaf; right = Leaf}}

(** [gb_one_deep_list_xxx] is a list with three items used to compare to tree that with a depth of one for binary tree traversal alogrithms *)
let gb_one_deep_list_pre = [0; -1; 1]
let gb_one_deep_list_post = [-1; 1; 0]
let gb_one_deep_list_in = [-1; 0; 1]


(** [gb_valid_three_deep] is a valid and sorted binary tree with a depth of three that is used to compare to list for binary tree traversal alogrithms *)
let gb_valid_three_deep =
    Node { value = 0
         ; left = Node { value = -12
                       ; left = Node { value = -100
                                     ; left = Node { value = -1000
                                                   ; left = Leaf
                                                   ; right = Leaf }
                                     ; right = Node { value = -17
                                                    ; left = Leaf
                                                    ; right = Leaf }
                                     }
                       ; right = Node { value = -3
                                      ; left = Node { value = -7
                                                    ; left = Leaf
                                                    ; right = Leaf}
                                      ; right = Node { value = -1
                                                     ; left = Leaf
                                                     ; right = Leaf }
                                      }
                       }
         ; right = Node { value = 9
                        ; left = Node { value = 3
                                      ; left = Node { value = 1
                                                    ; left = Leaf
                                                    ; right = Leaf }
                                      ; right = Node { value = 7
                                                      ; left = Leaf
                                                      ; right = Leaf }
                                      }
                        ; right = Node { value = 100
                                       ; left = Node { value = 42
                                                     ; left = Leaf
                                                     ; right = Leaf}
                                       ; right = Node { value = 1000
                                                      ; left = Leaf
                                                      ; right = Leaf }
                                       }
                        }
         }

(** [gb_three_deep_list_xxx] is a list with three items used to compare to a tree with a depth of three for binary tree traversal alogrithms *)
let gb_three_deep_list_pre = [0; -12; -100; -17; -3; -7; -1; 9; 3; 1; 7; 100; 42; 1000]
let gb_three_deep_list_post = [-1000; -17; -100; -7; -1; -3; -12; 1; 7; 13; 42; 1000; 100; 9; 0]
let gb_three_deep_list_in = [-1000; -100; -17; -12; -7; -3; -1; 0; 1; 3; 7; 9; 42; 100; 1000]
