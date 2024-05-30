class Parent
    def say_hi
      p "Hi from Parent."
    end
  end
  
# Parent.superclass       # => Object

class Child < Parent
    def say_hi
      p "Hi from Child."
    end

    def send
        p "send from Child..."
    end
  end
  
child = Child.new
child.say_hi         # => "Hi from Child."(if no send)



son = Child.new
son.send :say_hi       # => "Hi from Child."


#instance of method
c = Child.new
c.instance_of? Child      # => true
c.instance_of? Parent     # => false