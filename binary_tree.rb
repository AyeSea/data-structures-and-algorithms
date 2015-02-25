class BinaryTree
  attr_accessor :contents

  def initialize(arr)
    @contents = build_tree(arr)
  end

  def build_tree(arr)
    root = Node.new(arr.shift)
    arr.each { |value| add_node(Node.new(value, parent = root), root) }
  end

  def add_node(node, parent)
    if node.value <= parent.value
      parent.lchild.nil? ? parent.lchild = node : add_node(node, parent.lchild)
    else
      parent.rchild.nil? ? parent.rchild = node : add_node(node, parent.rchild)
    end
  end
end

class Node
  attr_accessor :value, :parent, :lchild, :rchild

  def initialize(value, parent = nil, lchild = nil, rchild = nil)
    @value = value
    @parent = parent
    @lchild = lchild
    @rchild = rchild
  end
end

tree = BinaryTree.new([1, 7, 4, 23, 8, 9, 4])
p tree.contents