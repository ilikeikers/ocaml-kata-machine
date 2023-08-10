open OUnit2
open Builtin_implementation.Assoc_list
open Test_helpers.Gb_lists
open Test_helpers.Helpers

let bindings_test name output input =
  name
  >:: fun _ ->
  assert_equal
    output
    (Assoc_list_map.bindings input)
    ~printer:(pp_list (pp_pair string_of_int pp_string))
    ~cmp:cmp_set_like_lists
;;

let find_tests name output input key =
  name >:: (fun _ -> assert_equal output (Assoc_list_map.find key input))
;;

let assoc_tests =
  let open Assoc_list_map in
  [
    bindings_test "empty has no bindings" [] empty;
    bindings_test "singleton list has 1 binding" gb_list1 (of_list gb_list1);
    bindings_test "list with two bindings" gb_list2 (of_list gb_list2);
    bindings_test "list with three bindings" gb_list3 (of_list gb_list3);
    bindings_test
      "add one to empty list"
      gb_list1
      (of_list (insert gb_key1 gb_val1 empty));
    bindings_test
      "add one to singleton list"
      gb_list2
      (of_list (insert gb_key2 gb_val2 gb_list1));
    bindings_test
      "add one to double list"
      gb_list3
      (of_list (insert gb_key3 gb_val3 gb_list2));
    bindings_test
      "remove one from triple list"
      gb_list2
      (of_list (remove gb_key3 gb_list3));
    bindings_test
      "remove one from triple list"
      gb_list1
      (of_list (remove gb_key2 gb_list2));
    bindings_test "remove one from triple list" empty (of_list (remove gb_key1 gb_list1));
    find_tests "find gb_key in triple list" (Some gb_val3) gb_list3 gb_key3;
    find_tests "find gb_key in double list" (Some gb_val2) gb_list3 gb_key2;
    find_tests "find gb_key in single list" (Some gb_val1) gb_list1 gb_key1;
    find_tests "find gb_key in empty list" None empty gb_key1;
    find_tests "find bad gb_key in triple list" None gb_list3 17;
  ]
;;

let suite = "maps suite" >::: assoc_tests
let _ = run_test_tt_main suite
