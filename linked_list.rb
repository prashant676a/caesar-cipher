class Node
  attr_accessor :value, :next
  def initialize(value, next_link=nil)
    @value=value
    @next=next_link
  end

  def to_s
    "#{self.value}"
  end
end

class LinkedList
  # attr_accessor :head

  def initialize
    @head=nil
    @size=0
  end

  def append(value)
    if @head.nil?
      @head= Node.new(value)
    else
      itr = @head
      while (itr.next != nil)
        itr = itr.next
      end
      itr.next = Node.new(value)
    end
    @size+=1
  end

  def prepend(value)
    if @head.nil?
      @head= Node.new(value)
    else
      new_node = Node.new(value)
      new_node.next = @head
      @head = new_node

    end
    @size += 1
  end

  def to_s
    str_to_return = ""
    if !head.nil?
      itr = @head
      while !itr.nil?
        # print("#{itr.value}-->")
        str_to_return << "#{itr.value}-->"
        itr = itr.next
      end
      # puts "nil"
      str_to_return << "nil"
    end
    str_to_return
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    if !head.nil?
      itr = @head
      while itr.next != nil
        itr = itr.next
      end
      itr
    end
  end

  def at(index)
    if index >= 0 && index < size
      i=0
      itr=@head
      while itr != nil
        return itr if index == i
        i+=1
        itr=itr.next
      end
    end
    "index out of range #{index}: index between 0 and #{size-1} inclusive"
  end

  def pop
    index = 1
    itr = @head

    while itr
      if index == size-1
        itr.next = nil
        return
      else
        itr = itr.next
        index += 1
      end
    end
  end

  def contains?(value)
    itr = @head
    while itr != nil
      return true if itr.value == value
      itr=itr.next
    end
    return false
  end

  def find(value)
    itr = @head
    index = 0
    while itr != nil
      return index if itr.value == value
      index += 1
      itr=itr.next
    end
    return -1
  end

  def insert_at(value, index)
    if index <= size && index > 0
      i = 0
      itr = @head
      while itr
        if i==index-1
          new_node = Node.new(value)
          new_node.next = itr.next
          itr.next = new_node
          break
        end
        itr = itr.next
        i+=1
      end
      @size += 1
    else
      "give a proper index between 1 and #{size-1}"
    end

  end

  # def remove_at(index)
    ##will implement in free time.(but it's easy.)
  # end
end

a = LinkedList.new()
a.append(2)
a.append(4)
a.append(6)
a.prepend(9)

puts a
# puts a.size
# puts a.head
# puts a.tail
# (-1..4).each do |i|
#   puts a.at(i)
# end

# a.pop
# puts a
puts a.contains?(6)
puts a.contains?(5)
puts a.contains?(9)

puts a.find(6)
puts a.find(5)
puts a.find(9)


a.insert_at(5,2)
puts a
