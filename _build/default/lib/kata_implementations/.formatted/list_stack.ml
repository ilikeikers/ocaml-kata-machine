(** [List_stack] is the implementation of the stack data structure. *)
module List_stack : Stack_ds.S = struct
  (** ['a t] is the type of stack. This is a FILO structure. *)
  type 'a t = 'a list

  let empty = []

  (** Efficiency: O(1). *)
  let is_empty = function
    | [] -> true
    | _ -> false
  ;;

  (** Effciency: O(1). *)
  let push x = List.cons x

  (** Efficiency: O(1). *)
  let peek = function
    | [] -> None
    | h :: _ -> Some h
  ;;

  (** Efficiency: O(1). *)
  let pop = function
    | [] -> None
    | _ :: t -> Some t
  ;;

  (** Efficiency: O(n). *)
  let size = List.length

  (** Efficiency: O(1). *)
  let to_list = Fun.id
end
