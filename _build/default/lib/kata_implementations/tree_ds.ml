module type T = sig
    type 'a tree =
      | Leaf
      | Node of 'a node

    and 'a node = {
      value: 'a;
      left: 'a tree;
      right: 'a tree
    }
end
