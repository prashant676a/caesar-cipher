class Node
  attr_accessor :value, :left, :right
  def initialize(value,left=nil, right=nil)
    @value=value
    @left=left
    @right=right
    # @height=1
  end
end

class Tree
  attr_reader :root
  def initialize(array)
    @root = build_tree(array.sort.uniq, 0, array.uniq.length-1)
    @size = array.uniq.length
  end

  def build_tree(arr,start, last)
    if start > last
      return nil
    end

    mid_index = (start + last) / 2

    root = Node.new(arr[mid_index])


    root.left = build_tree(arr, start, mid_index - 1)
    root.right = build_tree(arr, mid_index + 1, last)

    return root

  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


  def print_level_order(node = self.root)
    if node!=nil
      queue = []
      queue.push(node)

      while(queue.size != 0)
        node = queue.shift
        print "-->#{node.value}"

        children = [node.left, node.right].compact # it contains non nil node


        children.each do |child|
          queue.push(child)
        end
      end
    end
  end

  def balanced?
    balanced_helper(@root)
  end

  def depth(node = @root)
    return 0 if node.nil?
    1 + [depth(node.left), depth(node.right)].max
  end

  def inorder(node = @root, result = [])
    return result if node.nil?
    inorder(node.left, result)
    result << node.value
    inorder(node.right, result)
    result
  end

  def preorder(node = @root, result = [])
    return result if node.nil?
    result << node.value
    preorder(node.left, result)
    preorder(node.right, result)
    result
  end

  def postorder(node = @root, result = [])
    return result if node.nil?
    postorder(node.left, result)
    postorder(node.right, result)
    result << node.value
    result
  end

  def find(value, node = @root)
    return node if node.nil? || node.value == value
    if value < node.value
      find(value, node.left)
    else
      find(value, node.right)
    end
  end

  def insert(value)
    curr_node = @root
    previous_node = @root

    #find postion
    while curr_node != nil
      previous_node = curr_node
      if value < curr_node.value
        curr_node = curr_node.left
      else
        curr_node = curr_node.right
      end
    end

    if value < previous_node.value
      previous_node.left = Node.new(value)
    else
      previous_node.right = Node.new(value)
    end
    @size+=1
  end

  def delete(value)
    @root = delete_node(@root, value)
  end

  def rebalance(node=@root)
    if balance_factor(node) > 1
      if balance_factor(node.left) >= 0
        node = right_rotate(node)
      else
        node.left = left_rotate(node.left)
        node = right_rotate(node)
      end
    elsif balance_factor(node) < -1
      if balance_factor(node.right) <= 0
        node = left_rotate(node)
      else
        node.right = right_rotate(node.right)
        node = left_rotate(node)
      end
    end
    return node
  end

  private
  def balanced_helper(node)
    return true if node.nil?
    left_height = height(node.left)
    right_height = height(node.right)
    return false if (left_height - right_height).abs > 1
    balanced_helper(node.left) && balanced_helper(node.right)
  end

  def delete_node(node, value)
    return node if node.nil?

    if value < node.value
      node.left = delete_node(node.left, value)
    elsif value > node.value
      node.right = delete_node(node.right, value)
    else
      # Node with one or no child
      if node.left.nil?
        return node.right
      elsif node.right.nil?
        return node.left
      end

      # Node with two children
      node.value = min_value(node.right)
      node.right = delete_node(node.right, node.value)
    end

    # Rebalance the tree
    node = rebalance(node)

    return node
  end

  def min_value(node)
    min = node.value
    while node.left != nil
      min = node.left.value
      node = node.left
    end
    return min
  end

  def balance_factor(node)
    (height(node.left) - height(node.right))
  end

  def height(node)
    return 0 if node.nil?
    1 + [height(node.left), height(node.right)].max
  end


  def left_rotate(node)
    new_root = node.right
    node.right = new_root.left
    new_root.left = node
    return new_root
  end

  def right_rotate(node)
    new_root = node.left
    node.left = new_root.right
    new_root.right = node
    return new_root
  end


end


# array = [1, 7, 4, 23, 8, 9, 4, 3, 6, 7, 9, 67, 6345, 324]
# list = Tree.new(array)

# p list.pretty_print
# list.insert(555)
# list.insert(556)


# list.pretty_print
# list.delete(555)
# list.pretty_print

# list.print_level_order


# Create a binary search tree from an array of random numbers
random_array = Array.new(15) { rand(1..100) }
puts "Random array: #{random_array}"
tree = Tree.new(random_array)

# Confirm that the tree is balanced
puts "Tree is balanced? #{tree.balanced?}"

# Print out all elements in level, pre, post, and in-order
puts "Inorder: #{tree.inorder}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"

# Unbalance the tree by adding several numbers > 100
tree.insert(101)
tree.insert(102)
tree.insert(103)
tree.insert(104)
tree.insert(105)

# Confirm that the tree is unbalanced
puts "Tree is balanced? #{tree.balanced?}"

# Balance the tree by calling #rebalance
tree.rebalance

# Confirm that the tree is balanced
puts "Tree is balanced? #{tree.balanced?}"

# Print out all elements in level, pre, post, and in-order
puts "Inorder: #{tree.inorder}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"
