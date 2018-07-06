class Student
  attr_accessor :first_name, :last_name
  def get_set
    puts 
  end
  def full_name
    puts "#{@first_name}" + " #{@last_name}"
  end
  def add_course(course_name)
    list_of_courses = Array.new
    @course_name = course_name
    if list_of_courses.include?("#{@course_name}") == false 
      list_of_courses.push(@course_name)          
    end    
    puts list_of_courses
  end
end

student = Student.new
student.first_name = 'Tran'
student.last_name = 'Hoang'
student.first_name
student.full_name
student.add_course('Math')
student.add_course('Education')