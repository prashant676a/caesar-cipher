#usecae of modules (group related classes)

module Mammal
    class Dog
      def speak(sound)
        p "#{sound}"
      end
    end
  
    class Cat
      def say_name(name)
        p "#{name}"
      end
    end
end

doggy = Mammal::Dog.new
kitty = Mammal::Dog.new


#second use case is using modules as container for methods
module Mammal
    ...
  
    def self.some_out_of_place_method(num)
      num ** 2
    end
end

#we can call this directly from module as 
value = Mammal.some_out_of_place_method(4) #preferred
value = Mammal::some_out_of_place_method(4) 
