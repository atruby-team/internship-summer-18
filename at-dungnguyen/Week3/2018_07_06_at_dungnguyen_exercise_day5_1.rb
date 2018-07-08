class Student
  attr_accessor :first_name, :last_name
  attr_reader :list_of_courses

  def initialize
    @list_of_courses = []
  end

  def add_course(course)
    @list_of_courses.push(course) unless @list_of_courses.any? { |s| s.casecmp(course).zero? }
  end

  def remove_course(course)
    @list_of_courses.delete(course) if @list_of_courses.any? { |s| s.casecmp(course).zero? }
  end
end

stu = Student.new
stu.first_name = 'Dung'
stu.last_name = 'Nguyen'
puts stu.first_name
puts stu.last_name

stu.add_course('Math')
stu.add_course('Programming')
print stu.list_of_courses
puts
stu.add_course('math')
print stu.list_of_courses
puts
stu.remove_course('Math')
print stu.list_of_courses
puts
