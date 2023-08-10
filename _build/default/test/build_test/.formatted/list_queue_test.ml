open OUnit2
open Builtin_implementation.List_queue

let queue_tests name output input = name >:: (fun _ -> assert_equal output input)

(** [assoc_tests] DOESN'T TEST EMPTY STACKS FOR EITHER POP OR PEEK *)
let assoc_tests =
  let open List_queue in
  [
    queue_tests "empty has no items" true (is_empty empty);
    queue_tests "enqueue one item on an empty queue" [1] (enqueue 1 empty);
    queue_tests "enqueue one item on an single item queue" [2; 1] (enqueue 1 [2]);
    queue_tests "front of a empty queue" None (front empty);
    queue_tests "front of a queue with one item" (Some 1) (front [1]);
    queue_tests "front of a queue with two items" (Some 1) (front [1; 2]);
    queue_tests "dequeue on a empty queue" None (dequeue empty);
    queue_tests "dequeue on a queue with one item" (Some []) (dequeue [1]);
    queue_tests "dequeue on a queue with two items" (Some [1]) (dequeue [2; 1]);
    queue_tests "size of empty queue" 0 (size empty);
    queue_tests "size of queue with one item" 1 (size [1]);
    queue_tests "size of queue with two items" 2 (size [1; 2]);
    queue_tests "to_list of empty queue" [] (to_list empty);
    queue_tests "to_list of queue with one item" [1] (to_list [1]);
    queue_tests "to_list of queue with two items" [1; 2] (to_list [1; 2]);
  ]
;;

let suite = "queue suite" >::: assoc_tests
let _ = run_test_tt_main suite
