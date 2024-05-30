#mixing in modules

#in some cases : inheritance is the worst way to implement things

#wherever you need mix in that method from module


module Swimming
    def swim
        "hey we swimmin'"
    end
end

class Animmal; end

class Fish < Animal
    include Swimming   #mixin in 
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimming         # mixing in Swimmable module
end


puppy = Dog.new
shark = Fish.new
paws = Cat.new

puppy.swim  #can access
# paws.swim : no method error


#Ruby convention : use able syntax at end of modules
# e.g swimmable. (quite common way)




#mixins are also called interface inheritance.



#is-a-relationship -> class inhertiance
#has-a-relation -> (composition + aggregation) -> interface inhertiance



#method lookup order -> class itself, last included first for modules, object, kernel, basicobject
#modules included in the superclass are also included in method lookup path.