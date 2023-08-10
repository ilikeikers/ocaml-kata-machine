module type Q = sig
  (** An ['a t] is a queue whose elements have type ['a]. *)
  type 'a t = {
    o: 'a list;
    i: 'a list;
  }

  (** [empty] is the empty queue. *)
  val empty : 'a t

  (** [is_empty q] is whether [q] is empty. *)
  val is_empty : 'a t -> bool

  (** [enqueue x q] is the queue [q] with [x] added to the end. *)
  val enqueue : 'a -> 'a t -> 'a t

  (** [front q] is the element at the front of the queue.
      Returns None if [q] is empty. *)
  val front : 'a t -> 'a option

  (** [dequeue q] is the queue containing all the elements of [q] except the
      front of [q]. Returns None if empty. *)
  val dequeue : 'a t -> 'a t option

  (** [size q] is the number of elements in [q]. *)
  val size : 'a t -> int

  (** [to_list q] is a list containing the elements of [q] in order from
      front to back. *)
  val to_list : 'a t -> 'a list
end
