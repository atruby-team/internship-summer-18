# class Student
class Student
  attr_accessor :first_name, :last_name

  def initialize
    @list_courses = []
  end

  def full_name
    first_name << ' ' << last_name
  end

  def add_course(course)
    return false if @list_courses.include? course
    @list_courses << course
    course
  end

  def show
    @list_courses.to_s
  end

  def remove_course(sourse)
    @list_courses.delete(sourse) ? sourse : false
  end
end

student = Student.new
student.first_name = 'Kaylene' # "Kaylene"
student.last_name = 'Johnson' # "Johnson"
student.first_name # "Kaylene"
student.full_name # "Kaylene Johnson"
student.add_course('Math') # "Math"
student.show # ["Math"]
student.add_course('Math') # false
student.remove_course('English') # false
student.add_course('English') # "English"
student.remove_course('Math') # "Math"
student.add_course('Programming') # "Programming"
student.show # ["English", "Programming"]
