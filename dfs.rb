class BinarySearchTree
  attr_accessor :root, :size
  def initialize()
    @root= nil
    @size= 0
  end

  def add_node(value)
    if @root == nil
      @root = Node.new(value)
    else
      curr_node = @root
      previous_node = @root

      #finding position
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

    end
    @size+=1
  end


  def print_in_order(node = self.root)
    if node != nil
      print_in_order(node.left)
      print"--> #{node.value}"
      print_in_order(node.right)
    # else
    #   puts "binary search tree is empty."
    end
  end

  def print_level_order(node = self.root)
    if node!=nil
      queue = []
      queue.push(node)

      while(queue.size !=0)
        node = queue.shift
        print "-->#{node.value}"

        children = [node.left, node.right].compact # it contains non nil node


        children.each do |child|
          queue.push(child)
        end
      end
    end

  end


end

class Node
  attr_accessor :value, :left, :right
  def initialize(data)
    @value=data
    @left=nil
    @right=nil
  end

end

# class Queue
#   attr_accessor :values, :front, :rear
#   def initialize(root_node)
#     @values = root_node
#     @front = 0
#     @rear = 0
#   end

#   def enqueue(node)

#   end

#   def dequeue

#   end
# end

a = BinarySearchTree.new
a.add_node(5)
a.add_node(7)
a.add_node(1)
a.add_node(6)

a.print_level_order
#this is just bfs
