module List_queue : Queue_ds.Q = struct
  (** The list [x1; x2; ...; xn] represents the queue with [x1] at its front,
      followed by [x2], ..., followed by [xn]. *)
  type 'a t = 'a list

  let empty = []

  (** Efficiency: O(1). *)
  let is_empty = function
    | [] -> true
    | _ -> false
  ;;

  (** Efficiency: O(n). *)
  let enqueue x q = q @ [x]

  (** Efficiency: O(1). *)
  let front = function
    | [] -> None
    | x :: _ -> Some x
  ;;

  (** Efficiency: O(1). *)
  let dequeue = function
    | [] -> None
    | _ :: q -> Some q
  ;;

  (** Efficiency: O(n). *)
  let size = List.length

  (** Efficiency: O(1). *)
  let to_list = Fun.id
end
