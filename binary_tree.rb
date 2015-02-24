class Node
	attr_accessor :value, :parent, :left_child, :right_child

	def initialize(value, parent = nil, left_child = nil, right_child = nil)
		@value = value
		@parent = parent
		@left_child = left_child
		@right_child = right_child
	end
end


def build_tree(arr, parent = nil, tree = [])
	return arr[0] if arr.size == 1

	midpt_idx = arr.size / 2
	midpt = arr[midpt_idx]

	root = Node.new(midpt)

	root.parent = parent
	root.left_child = build_tree(arr[0...midpt_idx], root.value)
	root.right_child = build_tree(arr[midpt_idx + 1..-1], root.value)

	tree << root
	tree
end

#p build_tree([1, 2, 3])
p build_tree([0, 1, 2, 3, 4, 5, 6])