open OUnit2
open Practice.Assoc_list

(** [cmp_set_like_lists lst1 lst2] compares two lists to see whether they are equivalent
    set-like lists. That results in checking both that neither list contains duplicates as
    well as checking they do contain the same elements. *)
let cmp_set_like_lists lst1 lst2 =
  let uniq1 = List.sort_uniq compare lst1 in
  let uniq2 = List.sort_uniq compare lst2 in
  List.length lst1 = List.length uniq1
  && List.length lst2 = List.length uniq2
  && uniq1 = uniq2
;;

(** [pp_string s] pretty-prints string [s]. *)
let pp_string s = "\"" ^ s ^ "\""

(** [pp_list pp_elt lst] pretty-prints list [lst], usint [pp_elt]
    to pretty-print each elemt of [lst]. *)
let pp_list pp_elt lst =
  let pp_elts lst =
    let rec loop n acc = function
      | [] -> acc
      | [h] -> acc ^ pp_elt h
      | h1 :: (_ :: _ as t') ->
        if n = 100 then
          acc ^ "..." (* will stop printing a long list *)
        else
          loop (n + 1) (acc ^ pp_elt h1 ^ "; ") t'
    in
    loop 0 "" lst
  in
  "[" ^ pp_elts lst ^ "]"
;;

(** [pp_pair pp1 pp2 (a, b)] pretty-prints [(a, b)] using [pp1]  for
    [a] and [pp2] for [b]. *)
let pp_pair pp1 pp2 (a, b) = "(" ^ pp1 a ^ ", " ^ pp2 b ^ ")"

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

let get_key lst x = List.nth lst x |> fst
let get_val lst x = List.nth lst x |> snd
let lst1 = [-1, ""]
let key1 = get_key lst1 0
let val1 = get_val lst1 0
let lst2 = [key1, val1; 0, " "]
let key2 = get_key lst2 1
let val2 = get_val lst2 1
let lst3 = [key1, val1; key2, val2; 42, "LUE"]
let key3 = get_key lst3 2
let val3 = get_val lst3 2

let assoc_tests =
  let open Assoc_list_map in
  [
    bindings_test "empty has no bindings" [] empty;
    bindings_test "singleton list has 1 binding" lst1 (of_list lst1);
    bindings_test "list with two bindings" lst2 (of_list lst2);
    bindings_test "list with three bindings" lst3 (of_list lst3);
    bindings_test "add one to empty list" lst1 (of_list (insert key1 val1 empty));
    bindings_test "add one to singleton list" lst2 (of_list (insert key2 val2 lst1));
    bindings_test "add one to double list" lst3 (of_list (insert key3 val3 lst2));
    bindings_test "remove one from triple list" lst2 (of_list (remove key3 lst3));
    bindings_test "remove one from triple list" lst1 (of_list (remove key2 lst2));
    bindings_test "remove one from triple list" empty (of_list (remove key1 lst1));
    find_tests "find key in triple list" (Some val3) lst3 key3;
    find_tests "find key in double list" (Some val2) lst3 key2;
    find_tests "find key in single list" (Some val1) lst1 key1;
    find_tests "find key in empty list" None empty key1;
    find_tests "find bad key in triple list" None lst3 17;
  ]
;;

let suite = "maps suite" >::: assoc_tests
let _ = run_test_tt_main suite
