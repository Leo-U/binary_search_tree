# This script tests the code in bst.rb as per the lesson instructions

require_relative 'bst.rb'

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