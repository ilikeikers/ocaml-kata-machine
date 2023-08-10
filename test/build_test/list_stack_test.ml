open OUnit2
open Builtin_implementation.List_stack

let stack_tests name output input = name >:: (fun _ -> assert_equal output input)

(** [assoc_tests] DOESN'T TEST EMPTY STACKS FOR EITHER POP OR PEEK *)
let assoc_tests =
  let open List_stack in
  [
    stack_tests "empty has no items" true (is_empty empty);
    stack_tests "push one item on an empty stack" [1] (push 1 empty);
    stack_tests "peek on a empty stack" None (peek empty);
    stack_tests "peek on a stack with one item" (Some 1) (peek [1]);
    stack_tests "peek on a stack with two items" (Some 1) (peek [1; 2]);
    stack_tests "pop on a empty stack" None (pop empty);
    stack_tests "pop on a stack with one item" (Some []) (pop [1]);
    stack_tests "pop on a stack with two items" (Some [1]) (pop [2; 1]);
    stack_tests "size of empty stack" 0 (size empty);
    stack_tests "size of stack with one item" 1 (size [1]);
    stack_tests "size of stack with two items" 2 (size [1; 2]);
    stack_tests "to_list of empty stack" [] (to_list empty);
    stack_tests "to_list of stack with one item" [1] (to_list [1]);
    stack_tests "to_list of stack with two items" [1; 2] (to_list [1; 2]);
  ]
;;

let suite = "stack suite" >::: assoc_tests
let _ = run_test_tt_main suite
