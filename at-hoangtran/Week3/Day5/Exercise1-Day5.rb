class Student
  attr_accessor :first_name, :last_name, :list_of_courses
  def initialize
    @list_of_courses = []
  end

  def full_name
    puts @first_name.to_s + ' ' + @last_name.to_s
  end

  def add_course(course_name)
    @list_of_courses.push(course_name) unless @list_of_courses.include?(course_name)
  end

  def remove_course(course_name)
    @list_of_courses.delete(course_name) if @list_of_courses.include?(course_name)
  end
end
student = Student.new
student.list_of_courses = ['math', 'history']
student.first_name = 'Tran'
student.last_name = 'Hoang'
puts student.full_name
puts student.first_name
student.add_course('physical')
student.remove_course('math')
print student.list_of_courses
