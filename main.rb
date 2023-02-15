class Node
  attr_accessor :data, :left, :right

  def initialize (data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

class Tree
  def initialize(data_array)
    @root = build_tree(data_array)
  end
end

def build_tree(data_array)
  return if data_array.empty?
  middle_index = (data_array.length - 1) / 2
  root = Node.new(data_array[middle_index])
  root.left = build_tree(data_array[0...middle_index])
  root.right = build_tree(data_array[(middle_index + 1)..-1])
  root
end

def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end

data_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

root = build_tree(data_array)
pretty_print root