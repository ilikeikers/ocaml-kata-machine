module Batch_queue : Batch_queue_ds.Q = struct
  (** [{o; i}] represents the queue [o @ List.rev i].
      For example, [{o = [1; 2]; i = [5; 4; 3]}] represents the queue [1, 2, 3, 4, 5], where [1] is the front element.
      To avoid ambiguity about emptiness, whenever only one of the lists is empty, it must be [i].
      For example, [{o = [1]; i = []}] is a legal representation, but [{o = []; i = [1]}] is not.
      This implies that if [o] is empty, [i] must also be empty. *)
  type 'a t = {
    o: 'a list;
    i: 'a list;
  }

  (** Efficiency: O(1) *)
  let empty = { o = []; i = [] }

  (** Efficiency: O(1) *)
  let is_empty = function
    | { o = []; _ } -> true
    | _ -> false
  ;;

  (** Efficiency: O(1) *)
  let enqueue x = function
    | { o = []; _ } -> { o = [x]; i = [] }
    | { o; i } -> { o; i = x :: i }
  ;;

  (** Efficiency: O(1) *)
  let front = function
    | { o = []; _ } -> None
    | { o = h :: _; _ } -> Some h
  ;;

  (** Efficiency: O(1) (Amortized analysis) *)
  let dequeue = function
    | { o = []; _ } -> None
    | { o = [_]; i } -> Some { o = List.rev i; i = [] }
    | { o = _ :: t; i } -> Some { o = t; i }
  ;;

  (** Efficiency: O(n) *)
  let size { o; i } = List.(length o + length i)

  (** Efficiency: O(n) *)
  let to_list { o; i } = o @ List.rev i
end
