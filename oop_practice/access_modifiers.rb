#public, private, protected (method access controls)

#order of methods: private, protected, public
class GoodDog
    DOG_YEARS = 7
  
    attr_accessor :name, :age
  
    def initialize(n, a)
      self.name = n
      self.age = a
    end
    
    def public_disclosure
        "#{self.name} in human years is #{human_years}"
    end

    private
  
    def human_years
      age * DOG_YEARS
    end
  end
  
  sparky = GoodDog.new("Sparky", 4)
#   sparky.human_years  : not accessible from outside class.
puts sparky.public_disclosure