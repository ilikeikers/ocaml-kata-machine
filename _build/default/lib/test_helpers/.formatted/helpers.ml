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
