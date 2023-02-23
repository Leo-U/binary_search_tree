# additional gpt-generated driver script that tests every method 

require_relative 'bst.rb'

# create a Tree object with a sample data array
data_array = [8, 3, 10, 1, 6, 14, 4, 7, 13]
tree = Tree.new(data_array)

# test build_tree method
puts "Original Tree:"
tree.pretty_print
puts ""

#unbalance tree & test insert method:
tree.insert(tree.root, 100)
puts "Tree after inserting and unbalancing:"
tree.pretty_print
puts ""

# test balance method
tree = Tree.new(data_array)
puts "Balanced Tree:"
tree.root = tree.balance(tree.root)
p tree
tree.pretty_print
puts ""

# test find method
node = tree.find(tree.root, 6)
puts "Node found: #{node.data}"

# test delete method
tree.delete(tree.root, 7)
puts "Tree after deleting 8:"
tree.pretty_print
puts ""

# test level_order method
puts "Level order traversal:"
tree.level_order(tree.root) {|node| print "#{node.data} "}
puts ""

# test pre_order method
puts "Pre-order traversal:"
tree.pre_order(tree.root) {|node| print "#{node.data} "}
puts ""

# test in_order method
puts "In-order traversal:"
tree.in_order(tree.root) {|node| print "#{node.data} "}
puts ""

# test post_order method
puts "Post-order traversal:"
tree.post_order(tree.root) {|node| print "#{node.data} "}
puts ""

# test height method
puts "Height of the tree: #{tree.height(tree.root)}"

# test balanced? method
puts "Is the tree balanced? #{tree.balanced?(tree.root)}"

# test depth method
puts "Depth of node with data 8: #{tree.depth(tree.root, 8)}"
puts "Depth of node with data 14: #{tree.depth(tree.root, 14)}"
puts ""

# test pretty_print method
puts "Pretty print:"
tree.pretty_print
