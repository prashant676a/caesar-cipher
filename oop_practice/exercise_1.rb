class Vechile
    attr_accessor :color
    def initialize(color)
        @color = color
    end

    
end

class MyCar < Vechile
    CAR = "Cool Sexy Car"
    #inherits also accessor
    def print
        "my car is #{color} #{CAR}"
    end
end

a = MyCar.new("red")
puts a.print