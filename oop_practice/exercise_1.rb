class Vechile
    @@number_of_vehicle = 0

    def initialize
        @@number_of_vehicle += 1
    end

    def self.number_of_vehicles
        puts "This program has created #{@@number_of_vehicle} vehicles"
    end

    # attr_accessor :color
    # def initialize(color)
    #     @color = color
    # end

    def self.gas_mileage(gallons, miles)
        puts "#{miles / gallons} miles per gallon of gas"
      end
    
end

class MyCar < Vechile
    CAR = "Cool Sexy Car"
    #inherits also accessor
    def print
        "my car is #{color} #{CAR}"
    end
end

class MyTruck < Vechile 
    TRUCK = "I am a big boy"
end

a = MyCar.new("red")
puts a.print