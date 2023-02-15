class Node
  attr_accessor :data, :left, :right

  def initialize (data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

class Tree
  def initialize(data)
    #@root = return value of build_tree
  end
end

def build_tree(data, start = 0, stop = data.length - 1)
  return if start > stop
  data = data.sort
  mid = (start + stop) / 2
  root = Node.new(data[mid])
  root.left = build_tree(data, start, mid - 1)
  root.right = build_tree(data, mid + 1, stop)
  root
end

data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

root = build_tree(data)
p root