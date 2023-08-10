open OUnit2
open Builtin_implementation.Batch_queue

let queue_tests name output input = name >:: (fun _ -> assert_equal output input)

let enqueue_tests name output input x =
  name >:: (fun _ -> assert_equal output Batch_queue.(enqueue x input))
;;

(** [assoc_tests] DOESN'T TEST EMPTY STACKS FOR EITHER POP OR PEEK *)
let assoc_tests =
  let open Batch_queue in
  [
    queue_tests "empty has no items" true (is_empty empty);
    queue_tests "o has one item" false (is_empty { o = [1]; i = [] });
    enqueue_tests "enqueue one item on an empty queue" { o = [1]; i = [] } empty 1;
    enqueue_tests
      "enqueue one item on an single item queue"
      { o = [2]; i = [1] }
      { o = [2]; i = [] }
      1;
    enqueue_tests
      "enqueue one item on an split queue"
      { o = [2; 4]; i = [3; 1] }
      { o = [2; 4]; i = [1] }
      3;
    queue_tests "front of an empty queue" None (front empty);
    queue_tests "front of a queue with one item" (Some 1) (front { o = [1]; i = [] });
    queue_tests "front of a queue with two items" (Some 1) (front { o = [1; 3]; i = [2] });
    queue_tests "dequeue on an empty queue" None (dequeue empty);
    queue_tests
      "dequeue on a queue with singleton o and triple i"
      (Some { o = [3; 2; 1]; i = [] })
      (dequeue { o = [42]; i = [1; 2; 3] });
    queue_tests
      "dequeue on a queue with two items in o"
      (Some { o = [1]; i = [2; 3; 4] })
      (dequeue { o = [2; 1]; i = [2; 3; 4] });
    queue_tests "size of an empty queue" 0 (size empty);
    queue_tests "size of a queue with one item" 1 (size { o = [1]; i = [] });
    queue_tests "size of a queue with two items" 3 (size { o = [1; 3]; i = [2] });
    queue_tests "to_list of an empty queue" [] (to_list empty);
    queue_tests "to_list of a queue with one item in o" [1] (to_list { o = [1]; i = [] });
    queue_tests "to_list of a queue with one item in i" [1] (to_list { o = []; i = [1] });
    queue_tests
      "to_list of a queue with two items"
      [1; 2; 3]
      (to_list { o = [1]; i = [3; 2] });
  ]
;;

let suite = "queue suite" >::: assoc_tests
let _ = run_test_tt_main suite
