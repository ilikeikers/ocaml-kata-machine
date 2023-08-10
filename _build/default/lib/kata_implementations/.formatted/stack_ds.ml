module type S = sig
  (** ['a t] is the type of stack. *)
  type 'a t = 'a list

  (** [empty] is the empty stack. *)
  val empty : 'a t

  (** [is_empty] is checks if the stack is empty. *)
  val is_empty : 'a t -> bool

  (** [push x] adds [x] to the top of the stack. *)
  val push : 'a -> 'a t -> 'a t

  (** [peek] returns the value [x] that is found on the top of the stack.
      Returns None if stack is empty. *)
  val peek : 'a t -> 'a option

  (** [peek] returns the stack with the top value removed.
      Returns None if stack is empty. *)
  val pop : 'a t -> 'a t option

  (** [size] returns the size of the stack. *)
  val size : 'a t -> int

  (** [to_list] returns the stack as a list. *)
  val to_list : 'a t -> 'a list
end
