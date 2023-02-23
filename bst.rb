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

  def build_tree(data_array)
    data_array = data_array.sort.uniq
    return if data_array.empty?
    middle_index = (data_array.length - 1) / 2
    root = Node.new(data_array[middle_index])
    root.left = build_tree(data_array[0...middle_index])
    root.right = build_tree(data_array[(middle_index + 1)..-1])
    root
  end

  def balance(root)
    if balanced?(root)
      root
    else
      traversed_array = [];
      pre_order(root){ |a| traversed_array << a.data}
      build_tree(traversed_array)
    end
  end

  def find(root, data)
    raise 'Node not in tree' if root.nil?
    return root if data == root.data
    data < root.data ? find(root.left, data) : find(root.right, data)
  end

  def delete(root, data)
    if root.nil?
      raise 'Node not in tree'
    elsif data < root.data
      root.left = delete(root.left, data)
    elsif data > root.data
      root.right = delete(root.right, data)
    elsif data == root.data
      if root.left && root.right
        successor = root.right
        until successor.left.nil? do
          successor = successor.left
        end
        root.data = successor.data
        root.right = delete(root.right, successor.data)
      elsif root.left.nil?
        return root.right
      elsif root.right.nil?
        return root.left
      end
    end
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

  def level_order(root)
    queue = []
    return_me = []
    queue << root
    until queue.empty? do
      current = queue.shift
      return_me << current
      yield(current) if block_given?
      queue << current.left if current.left
      queue << current.right if current.right
    end
    return_me unless block_given?
  end
  
  def pre_order(root, &block)
    return if root.nil?
    yield root
    pre_order(root.left, &block)
    pre_order(root.right, &block)
  end

  def in_order(root, &block)
    return if root.nil?
    in_order(root.left, &block)
    yield root
    in_order(root.right, &block)
  end

  def post_order(root, &block)
    return if root.nil?
    post_order(root.left, &block)
    post_order(root.right, &block)
    yield root
  end

  def height(node, count = -1, arr = [])
    count += 1
    height(node.left, count, arr) if node.left
    height(node.right, count, arr) if node.right
    arr << count if node.left.nil? && node.right.nil?
    arr.max
  end

  def balanced?(root, result = [])
    return true if root.right.nil? && root.left.nil?
    result << -1 if (root.left.nil? || root.right.nil?)
    result << height(root.left) if root.left
    result << height(root.right) if root.right
    balanced?(root.left, result) if root.left
    balanced?(root.right, result) if root.right
    result.each_slice(2).to_a.all? do |el|
      (el[0] - el[1]).between?(-1, 1)
    end
  end

  def depth(root, data, count = 0)
    if root.nil?
      raise 'Node not in tree'
    elsif data < root.data
      depth(root.left, data, count + 1)
    elsif data > root.data
      depth(root.right, data, count + 1)
    elsif data == root.data
      count
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    raise 'No tree passed' if node.nil?
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
  
end