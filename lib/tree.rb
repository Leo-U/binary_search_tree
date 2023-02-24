class Tree
  attr_accessor :root
  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    array = array.sort.uniq
    return if array.empty?

    mid_index = (array.size - 1) / 2
    root = Node.new(array[mid_index])

    root.left = build_tree(array[0...mid_index])
    root.right = build_tree(array[(mid_index + 1)..-1])

    root
  end

  def insert(root, data)
    return Node.new(data) if root.nil?

    data < root.data ? root.left = insert(root.left, data) : root.right = insert(root.right, data)
    
    root
  end
  
  def delete(root, data)
    raise 'Node not in tree' if root.nil?

    if data == root.data
      # if node has two children
      if root.left && root.right
        succ = root.right; succ = succ.left while succ.left
        root.data = succ.data
        root.right = delete(root.right, succ.data)
      end

      # if node has one child or less
      root.left ? (return root.left) : (return root.right)

    else
      data < root.data ? root.left = delete(root.left, data) : root.right = delete(root.right, data)
    end
    root
  end

  def find(root, data)
    raise 'Node not in tree' if root.nil?
    return root if data == root.data
    data < root.data ? find(root.left, data) : find(root.right, data)
  end

  def level_order(root, queue = [], return_me = [])
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
    return 0 if node.nil?
    count += 1
    height(node.left, count, arr) if node.left
    height(node.right, count, arr) if node.right
    arr << count if node.left.nil? && node.right.nil?
    arr.max
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

  def balanced?(root)
    return true if root.nil?
    left_height = height(root.left)
    right_height = height(root.right)
    (left_height - right_height).abs <= 1 && balanced?(root.left) && balanced?(root.right)
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

  def pretty_print(node = @root, prefix = '', is_left = true)
    raise 'No tree passed' if node.nil?
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end