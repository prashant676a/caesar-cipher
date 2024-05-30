class Vehicle
    attr_accessor :year

    def initialize(year)
        self.year = year
    end

    def age
        "Vechile's age is #{years_old} years old."
    end

    private

    def years_old
        Time.now.year - self.year
    end
end

lumina = Vehicle.new(2017)
puts lumina.age
