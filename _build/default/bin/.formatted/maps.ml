module type Map = sig
  (** [('k, 'v) t] is the type of maps that bind keys of type
      ['k] to values of type ['v]. *)
  type ('k, 'v) t = ('k * 'v) list

  (** [empty] is the empty map. *)
  val empty : ('k, 'v) t

  (** [bindings m] is an association list containing the same
      bindings as [m]. There are no duplicates in the list. *)
  val bindings : ('k, 'v) t -> ('k * 'v) list

  (** [of_list lst] is a map containing the same bindings as
      association list [lst].
      Requires: [lst] does not contain any duplicate keys. *)
  val of_list : ('k * 'v) list -> ('k, 'v) t

  (** [insert k v m] is the same map as [m], but with an additional
      binding from [k] to [v].  If [k] was already bound in [m],
      that binding is replaced by the binding to [v] in the new map. *)
  val insert : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t

  (** [remove k m] is the same map as [m], but without any binding of [k].
      If [k] was not bound in [m], then the map is unchanged. *)
  val remove : 'k -> ('k, 'v) t -> ('k, 'v) t

  (** [find k m] is [Some v] if [k] is bound to [v] in [m],
      and [None] if not. *)
  val find : 'k -> ('k, 'v) t -> 'v option
end

module Assoc_list_map : Map = struct
  (** [[(k1, v1); (k2, v2); ...; (kn, vn)]] is the map [{k1: v1, k2: v2, ..., kn: vn}].
      If a key appears more than once in the list, then in the map it is bound to the left-most occurence in the list.
      For example, [[(k, v1); (k, v2)]] represents the map [{k : v1}]. The empty list represents the empty map. *)
  type ('k, 'v) t = ('k * 'v) list

  let empty = []

  (** [keys m] is a list of the keys in [m], without any duplicates
      Efficiency: O(n log n). *)
  let keys m = m |> List.map fst |> List.sort_uniq Stdlib.compare

  (** [binding m] is [(k, v)] where [v] is the value that [k] binds in [m].
      Requires: [k] is a key in [m].
      Efficiency: O(n). *)
  let binding m k = k, List.assoc k m

  (** Efficiency: O(n log n) + O(n) * O(n) -> O(n^2) *)
  let bindings m = List.map (binding m) (keys m)

  (** Efficiency: O(1). *)
  let of_list lst = lst

  (** Efficiency: O(1). *)
  let insert k v m = (k, v) :: m

  (** Efficiency: O(n). *)
  let remove k m = List.filter (fun (k', _) -> k <> k') m

  (** [find k m] Can be simplified by removing [k, m] on both sides
      Efficiency: O(n). *)
  let find k m = List.assoc_opt k m
end
