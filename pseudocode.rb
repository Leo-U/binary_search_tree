# The purpose of the following pseudocode is to show the recursive calls by which the delete method in main.rb deletes values that have 2 children.

# Here's what the delete method looks like:

def delete(root, data)
  if data < root.data
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
      return root.right
    elsif root.right.nil?
      return root.left
    end
  end
  root
end


# Illustrate with pseudocode the deletion of 50 from the following binary tree:

              50           
           /      \        
      32              70   
     /  \            /  \  
  20      36      60      80
    \    /  \       \    /  \
    30  34  40      65  75   85



root = delete(root, 50)
  50 = 50, & l/r fields != nil, so
  root.data = successor.data
    root.right = delete(root.right, successor.data)
    60 < 70, so
      root.left = delete(root.left, data)
      60 = 60 & root.left.nil?, so
      return root.right
    return root
return root

# The resulting tree looks like:

              60           
           /      \        
      32              70   
     /  \            /  \  
  20      36      65      80
    \    /  \            /  \
    30  34  40          75   85




# Now illustrate the deletion of 36 (here's the original tree again):

              50           
           /      \        
      32              70   
     /  \            /  \  
  20      36      60      80
    \    /  \       \    /  \
    30  34  40      65  75   85



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
    return root
  return root
return root

# The resulting tree looks like:

              50           
           /      \        
      32              70   
     /  \            /  \  
  20      40      60      80
    \    /          \    /  \
    30  34          65  75   85