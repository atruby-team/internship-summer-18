class Student
  attr_accessor :first_name, :last_name
  def initialize
    @list_of_cousres = []
  end

  def full_name
    @last_name + ' ' + @first_name
  end

  def add_course(course)
    return false if @list_of_cousres.include?(course)
    @list_of_cousres.push(course)
    course
  end

  def remove_course(course)
    return false unless @list_of_cousres.include?(course)
    @list_of_cousres.delete(course)
    course
  end

  def show
    @list_of_cousres
  end
end

student = Student.new
student.first_name = 'Kaylene'
student.last_name = 'Johnson'
p student.first_name
p student.last_name
p student.full_name
student.add_course('Math')
p student.show
p student.add_course('Math')
p student.remove_course('English')
p student.add_course('English')
p student.remove_course('Math')
p student.add_course('Programming')
p student.show
