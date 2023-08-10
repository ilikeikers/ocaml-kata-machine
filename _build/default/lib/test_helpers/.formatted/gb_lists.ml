(** [get_key lst x] takes in a list of tuples and an index and returns the first value of the tuple *)
let get_key lst x = List.nth lst x |> fst

(** [get_val lst x] takes in a list of tuples and an index and returns the second value of the tuple *)
let get_val lst x = List.nth lst x |> snd

(** [gb_list1] is a used to glass box test a map with a negative key and empty value *)
let gb_list1 = [-1, ""]

(** [gb_key1] is a used to glass box test a map with a negative key *)
let gb_key1 = get_key gb_list1 0

(** [gb_val1] is a used to glass box test a map with a an empty value*)
let gb_val1 = get_val gb_list1 0

(** [gb_list2] is a used to glass box test a map with a zero key and single space value *)
let gb_list2 = [gb_key1, gb_val1; 0, " "]

(** [gb_key2] is a used to glass box test a map with a zero key *)
let gb_key2 = get_key gb_list2 1

(** [gb_val2] is a used to glass box test a map with a an almost empty value (string contains a space)*)
let gb_val2 = get_val gb_list2 1

(** [gb_list3] is a used to glass box test a map with a positive key and mixed value *)
let gb_list3 = [gb_key1, gb_val1; gb_key2, gb_val2; 42, "HGt!tG"]

(** [gb_key3] is a used to glass box test a map with a positive key *)
let gb_key3 = get_key gb_list3 2

(** [gb_val3] is a used to glass box test a map with a mixed string *)
let gb_val3 = get_val gb_list3 2
