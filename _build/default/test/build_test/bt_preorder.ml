open OUnit2
open Builtin_implementation.Bt_preorder
open Test_helpers.Gb_trees


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
