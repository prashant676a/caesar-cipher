class Student
    def initialize(name, grade)
        @name=name
        @grade=grade
    end

    # attr_accessor :name

    def better_grade_than?(other_student)
        grade > other_student.grade        
    end

    protected
    # attr_accessor :grade
    def grade
        @grade
    end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)