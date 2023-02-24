# This script tests the code in bst.rb as per the lesson instructions

require_relative '../lib/node.rb'
require_relative '../lib/tree.rb'

# method for testing traversal methods
def print_traversals(bst)
  puts "Breadth first (level-order) traversal: #{level_order_array = []; bst.level_order(bst.root) {|node| level_order_array << node.data}; level_order_array}"
  puts "Depth first (pre-order) traversal: #{pre_order_array = []; bst.pre_order(bst.root){ |node| pre_order_array << node.data}; pre_order_array}"
  puts "Depth first (in-order) traversal: #{in_order_array = []; bst.in_order(bst.root){ |node| in_order_array << node.data}; in_order_array}"
  puts "Depth first (post-order) traversal: #{post_order_array = []; bst.post_order(bst.root){ |node| post_order_array << node.data}; post_order_array}"
end

# Method for testing if tree is balanced
def print_balanced_status(bst)
  puts bst.balanced?(bst.root) ? 'The tree is balanced:' : 'The tree is not balanced:'
end

# build tree
random_array = (Array.new(15) { rand(1..100) })
bst = Tree.new(random_array)

# test #balance
puts ""
print_balanced_status(bst)
bst.pretty_print (bst.root)

# test #traversal methods
print_traversals(bst)
puts ""

# unbalance tree
bst.insert(bst.root, 200)
bst.insert(bst.root, 300)

# test #balanced? for unbalanced tree
print_balanced_status(bst)
bst.pretty_print (bst.root)
puts ""

# test #balance to rebalance tree
bst.root = bst.balance(bst.root)

# test #balanced? for unbalanced tree
print_balanced_status(bst)
bst.pretty_print (bst.root)

# test traversal methods for rebalanced tree
print_traversals(bst)
puts ""

# create a new Tree object with a sample data array
data_array = [8, 3, 10, 1, 6, 14, 4, 7, 13]
tree = Tree.new(data_array)
tree.pretty_print

# test find method
node = tree.find(tree.root, 6)
puts "Node found: #{node.data}"

# test height method
puts "Height of the tree: #{tree.height(tree.root)}"

# test height of a nil tree:
puts "Height of nil tree: #{tree.height(nil)}"

# test depth method
puts "Depth of node with data 8: #{tree.depth(tree.root, 8)}"
puts "Depth of node with data 14: #{tree.depth(tree.root, 14)}"
puts ""

# test insert method
puts "Tree after inserting node 0:"
tree.insert(tree.root, 0)
tree.pretty_print

# test delete method
tree.delete(tree.root, 7)
puts "Tree after deleting node with 2 children (node 7):"
tree.pretty_print
puts ""

puts "Tree after deleting node 1, which has one left child:"
tree.delete(tree.root, 1)
tree.pretty_print

puts "Tree after deleting node 4, which has 1 right child:"
tree.delete(tree.root, 4)
tree.pretty_print

puts "Tree after deleting node 14, which has no children:"
tree.delete(tree.root, 14)
tree.pretty_print
puts ""

# test error handling capability of #delete (SCRIPT INTENDED TO RAISE ERROR)
puts "TEST OF DELETE METHOD'S ERROR HANDLING, ERROR THROWN INTENTIONALLY:"
puts ""
tree.root = nil
tree.delete(tree.root, 13)