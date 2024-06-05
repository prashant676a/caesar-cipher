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



end


array = [1, 7, 4, 23, 8, 9, 4, 3, 6, 7, 9, 67, 6345, 324]
list = Tree.new(array)

# p list.pretty_print
p list.print_level_order
