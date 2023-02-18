class Node
  attr_accessor :data, :left, :right

  def initialize (data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

class Tree
  attr_accessor :root
  def initialize(data_array)
    @root = build_tree(data_array)
  end
end

def build_tree(data_array)
  data_array = data_array.sort.uniq
  return if data_array.empty?
  middle_index = (data_array.length - 1) / 2
  root = Node.new(data_array[middle_index])
  root.left = build_tree(data_array[0...middle_index])
  root.right = build_tree(data_array[(middle_index + 1)..-1])
  root
end

def insert(root, data)
  if root.nil?
    root = Node.new(data)
  elsif data < root.data
    root.left = insert(root.left, data)
  else
    root.right = insert(root.right, data)
  end
  root
end


def delete(root, data)
  if root.nil?
    raise 'Node not in tree'
  elsif data < root.data
    root.left = delete(root.left, data)
  elsif data > root.data
    root.right = delete(root.right, data)
  elsif data == root.data
    if !root.left.nil? && !root.right.nil?
      successor = root.right
      until successor.left.nil? do
        successor = successor.left
      end
      root.data = successor.data
      root.right = delete(root.right, successor.data)
    elsif root.left.nil?
      puts root.right.data if !root.right.nil?
      p nil if root.right.nil?
      return root.right
    elsif root.right.nil?
      puts root.left.data  if !root.left.nil?
      p nil if root.left.nil?
      return root.left
    end
  end
  puts root.data if !root.nil?
  p nil if root.nil?
  root
end





def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end



# data_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

data_array = [50,30,20,40,32,34,36,70,60,65,80,75,85]


tree = Tree.new(data_array)

pretty_print tree.root
tree.root = delete(tree.root, 36)

pretty_print tree.root
