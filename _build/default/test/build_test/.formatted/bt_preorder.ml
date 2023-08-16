open OUnit2
open Builtin_implementation.Bt_preorder
(*
   open Test_helpers.Gb_trees
*)

type 'a tree =
  | Leaf
  | Node of 'a node

and 'a node = {
  value: 'a;
  left: 'a tree;
  right: 'a tree;
}

(** [gb_empty_tree] is an emty tree used to compare to empty list for binary tree traversal alogrithms *)
let gb_empty_tree : 'a tree = Leaf

(** [gb_empty_list] is a used to compare for binary tree traversal alogrithms *)
let gb_empty_list : 'a list = []

(** [gb_valid_one_deep] is a valid and sortedtree with a depth of one used to compare to [gb_one_deep_list] for binary tree traversal alogrithms *)
let gb_valid_one_deep =
  Node
    {
      value = 0;
      left = Node { value = -1; left = Leaf; right = Leaf };
      right = Node { value = 1; left = Leaf; right = Leaf };
    }
;;

(** [gb_one_deep_list_xxx] is a list with three items used to compare to tree that with a depth of one for binary tree traversal alogrithms *)
let gb_one_deep_list_pre = [0; -1; 1]

let preorder_test name output input =
  name >:: (fun _ -> assert_equal output (preorder_traversal input))
;;

let preorder_lin_test name output input =
  name >:: (fun _ -> assert_equal output (preorder_traversal_lin input))
;;

let assoc_tests =
  [
    preorder_test
      "one_deep returns an preorder item list"
      gb_one_deep_list_pre
      gb_valid_one_deep;
    (*
       preorder_test "empty returns an empty list" gb_empty_list (preorder_traversal (gb_empty_tree));
       preorder_test "single_node returns an single item list" gb_single_list gb_single_node;
       preorder_test
       "three_deep returns an preorder item list"
       gb_three_deep_list_pre
       gb_valid_three_deep;
       preorder_lin_test "empty returns an empty list" gb_empty_list gb_empty_tree;
       preorder_lin_test
       "single_node returns an single item list"
       gb_single_list
       gb_single_node;
       preorder_lin_test
       "one_deep returns an preorder item list"
       gb_one_deep_list_pre
       gb_valid_one_deep;
       preorder_lin_test
       "three_deep returns an preorder item list"
       gb_three_deep_list_pre
       gb_valid_three_deep;
    *)
  ]
;;

let suite = "maps suite" >::: assoc_tests
let _ = run_test_tt_main suite
