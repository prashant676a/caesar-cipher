class Animal
    attr_accessor :name

    def initialize(name)
        @name = name 
    end

    def speak
        "hello #{name}"
    end
end

class Dog < Animal #inheritance
    # attr_accessor :name   #behind the scenes implementing getter and setter method

    def initialize(color)
        super
        @color = color
    end

    def speak               #method overriding
        "#{super} from speak method of dog class! and i'm #{@color}"
    end
end

class Cat < Animal
end

sparky = Dog.new("puppy")
# paws = Cat.new

puts sparky.speak
# puts paws.speak


#super -> method to call the base/parent classes same method.(and also invokes it.)
#mostly used with initialize