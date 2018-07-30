class Student
  attr_accessor :first_name, :last_name, :list_course
  def initialize
    @array = []
  end

  def full_name
    puts "#{first_name} #{last_name} "
  end

  def add_course(course)
    @array.push(course) unless @array.include?(course)
  end

  def remove_course(course)
    @array.delete(course) if @array.include?(course)
  end

  def courses
    puts "Course : #{@array}"
  end
end

student = Student.new
student.first_name = 'Chuong'
student.last_name = 'Phu'
student.full_name
student.add_course('Toan')
student.add_course('Toan')
student.add_course('Hoa')
student.add_course('Ha')
student.remove_course('Toan')
student.courses

