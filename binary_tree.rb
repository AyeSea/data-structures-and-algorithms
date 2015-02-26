class Node
  attr_accessor :value, :lchild, :rchild, :parent

  def initialize(value, parent = nil, lchild = nil, rchild = nil)
    @value = value
    @parent = parent
    @lchild = lchild
    @rchild = rchild
  end
end

def build_tree(arr)
  root = Node.new(arr.shift)
  arr.each { |value| insert(node = Node.new(value), root) }
  root
end

def insert(node, parent)
  node.parent = parent
  if node.value <= parent.value
    parent.lchild.nil? ? parent.lchild = node : insert(node, parent.lchild)
  else
    parent.rchild.nil? ? parent.rchild = node : insert(node, parent.rchild)
  end
end

def breadth_first_search(value, tree)
  queue = [tree]

  until queue.empty?
    node = queue.shift
    next if node == nil
    puts "Current node is #{node.value}."
    return value if value == node.value
    queue << node.lchild
    queue << node.rchild
  end

   nil
end

def depth_first_search(value, tree)
  stack = [tree]

  until stack.empty?
    node = stack.pop
    next if node == nil
    puts "Current node is #{node.value}."
    return value if value == node.value
    stack << node.lchild
    stack << node.rchild
  end

  nil
end

def dfs_rec(value, tree)
  puts "Current node is #{tree.value}."
  if value == tree.value
    return value
  elsif value < tree.value
    tree.lchild.nil? ? nil : dfs_rec(value, tree.lchild)
  elsif value > tree.value
    tree.rchild.nil? ? nil : dfs_rec(value, tree.rchild)
  end
end

tree = build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p tree
p breadth_first_search(324, tree)
p depth_first_search(324, tree)
p dfs_rec(324, tree)

