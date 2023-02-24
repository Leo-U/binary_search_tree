# This script tests the code in bst.rb as per the lesson instructions

require_relative '../lib/node.rb'
require_relative '../lib/tree.rb'

def print_traversals(bst)
  puts "Breadth first (level-order): #{level_order_array = []; bst.level_order(bst.root) {|node| level_order_array << node.data}; level_order_array}"
  puts "Depth first (pre-order): #{pre_order_array = []; bst.pre_order(bst.root){ |node| pre_order_array << node.data}; pre_order_array}"
  puts "Depth first (in-order): #{in_order_array = []; bst.in_order(bst.root){ |node| in_order_array << node.data}; in_order_array}"
  puts "Depth first (post-order): #{post_order_array = []; bst.post_order(bst.root){ |node| post_order_array << node.data}; post_order_array}"
end


def print_balanced_status(bst)
  puts bst.balanced?(bst.root) ? 'The tree is balanced.' : 'The tree is not balanced.'
end


random_array = (Array.new(15) { rand(1..100) })


bst = Tree.new(random_array)

print_traversals(bst)


bst.pretty_print (bst.root)
print_balanced_status(bst)

print_traversals(bst)

bst.insert(bst.root, 200)
bst.insert(bst.root, 300)

bst.pretty_print (bst.root)

print_balanced_status(bst)

bst.root = bst.balance(bst.root)
bst.pretty_print (bst.root)

print_balanced_status(bst)

print_traversals(bst)

# supplemental testing:

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

puts "Tree after rebalancing:"
tree.root = tree.balance(tree.root)
tree.pretty_print
puts ""

# test find method
node = tree.find(tree.root, 6)
puts "Node found: #{node.data}"

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

# test height of nil tree:

puts "Height of nil tree: #{tree.height(nil)}"

# test balanced? method
puts "Is the tree balanced? #{tree.balanced?(tree.root)}"

# test depth method
puts "Depth of node with data 8: #{tree.depth(tree.root, 8)}"
puts "Depth of node with data 14: #{tree.depth(tree.root, 14)}"
puts ""

# test pretty_print method
puts "Pretty print:"
tree.pretty_print

# test delete method
tree.delete(tree.root, 7)
puts "Tree after deleting node with 2 children (node 7):"
tree.pretty_print
puts ""

puts "Tree after inserting node 0:"
tree.insert(tree.root, 0)
tree.pretty_print

puts "Tree after deleting node 1, which has one left child:"
tree.delete(tree.root, 1)
tree.pretty_print

puts "Tree after deleting node 4, which has 1 right child:"
tree.delete(tree.root, 4)
tree.pretty_print

puts "Tree after deleting node 14, which has no children:"
tree.delete(tree.root, 14)
tree.pretty_print

puts "Test error raise clause in #delete:"
tree.root = nil
tree.delete(tree.root, 13)