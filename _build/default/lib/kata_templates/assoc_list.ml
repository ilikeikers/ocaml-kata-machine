module Assoc_list_map : Maps.M = struct
  (** [[(k1, v1); (k2, v2); ...; (kn, vn)]] is the map [{k1: v1, k2: v2, ..., kn: vn}].
      If a key appears more than once in the list, then in the map it is bound to the left-most occurence in the list.
      For example, [[(k, v1); (k, v2)]] represents the map [{k : v1}]. The empty list represents the empty map. *)

  type ('k, 'v) t = ('k * 'v) list

  let empty = []
  let bindings _ = failwith "unimplemented"
  let of_list _ = failwith "unimplemented"
  let insert _ _ _ = failwith "unimplemented"
  let remove _ _ = failwith "unimplemented"
  let find _ _ = failwith "unimplemented"
end
