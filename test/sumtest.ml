open OUnit2
open Implementation.Sum

let tests =
  "test suite for sum"
  >::: [ ("empty" >:: fun _ -> assert_equal 0 (sum []))
       ; ("singleton" >:: fun _ -> assert_equal 1 (sum [ 1 ]))
       ; ("two_elems" >:: fun _ -> assert_equal 7 (sum [ 3; 4 ]))
       ; ("two_elems_neg" >:: fun _ -> assert_equal 3 (sum [ -1; 4 ]))
       ]
;;

let _ = run_test_tt_main tests
