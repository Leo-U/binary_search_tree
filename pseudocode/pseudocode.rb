# This document illustrates the recursive calls by which the delete method in bst.rb deletes values that have 2 children.

# Here's the actual delete method (not pseudocode):

def delete(root, data)
  raise 'Node not in tree' if root.nil?

  if data == root.data
    # if node has two children
    if root.left && root.right
      succ = root.right; succ = succ.left while succ.left
      root.data = succ.data
      root.right = delete(root.right, succ.data)
    end

    # if node has one child or fewer
    root.left ? (return root.left) : (return root.right)

  else
    data < root.data ? root.left = delete(root.left, data) : root.right = delete(root.right, data)
  end
  root
end

              50           
           /      \        
      32              70   
     /  \            /  \  
  20      36      60      80
    \    /  \       \    /  \
    30  34  40      65  75   85


# The below pseudocode illustrates the deletion of 50 from the above binary tree:

root = delete(root, 50)
50 = 50, & l/r fields != nil, so
successor = 60
root.data = successor.data
  root.right = delete(root.right, successor.data)
  60 < 70, so
    root.left = delete(root.left, data)
    60 = 60 & root.left.nil?, so
    return root.right # 65
  return root # 70
return root # 60

# The resulting tree looks like:

              *60*           
           /       \        
      32               70   
     /  \             /   \  
  20      36       *65*    80
    \    /  \             /  \
    30  34  40          75    85


# Here's the original tree again:

              50           
           /      \        
      32              70   
     /  \            /  \  
  20      36      60      80
    \    /  \       \    /  \
    30  34  40      65  75   85


# The below pseudocode illustrates the deletion of 36 from the original tree:

root = delete(root, 36)
36 < 50, so
  root.left = delete(root.left, 36)
  36 > 32, so
    root.right = delete(root.right, 36)
    36 = 36 & !l/r.nil?, so
    successor = 40
    root.data = successor.data
      root.right = delete(root.right, successor.data)
      40 = 40 & root.left.nil?, so
      return root.right # nil
    return root # 40
  return root # 32
return root # 50

# The resulting tree looks like:

              50           
           /      \        
      32              70   
     /  \            /  \  
  20    *40*      60      80
    \    /          \    /  \
    30  34  x       65  75   85