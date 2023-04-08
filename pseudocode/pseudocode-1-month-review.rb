# This is a month-after review rewrite of pseudocode.rb

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


# Show the deletion of 50 from the above tree:

root = delete(root, 50)
  50 == 50, && l/r != nil, so
  root.data = succ.data
  root.right = delete(root.right, succ.data)
    50 < 70, so
    root.left = delete(root.left, data)
      60 = 60 && root.left.nil?, so
      return 65
    return 70
  return 60
end
      

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


# Show the deletion of 36 from the original tree

root = delete(root, 36)
  36 > 50, so
  root.left = delete(root.left, 36)
    36 > 32, so
    root.right = delete(root.right, 36)
      36 == 36, & l/r != nil, so
      succ = 40
      root.data = 40
      root.right = delete(root,right, 40)
        40 == 40 && l/r both == nil, so
        return root.left (which is nil)
    return 40
  return 32
return 50

# The resulting tree looks like:

              50           
           /      \        
      32              70   
     /  \            /  \  
  20    *40*      60      80
    \    /          \    /  \
    30  34          65  75   85