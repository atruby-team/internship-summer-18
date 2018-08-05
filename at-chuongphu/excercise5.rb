# ex1
class Student
  attr_accessor :first_name, :last_name, :list_course
  def initialize
    @list_course = []
  end

  def first_name
    puts @first_name.to_s
  end

  def last_name
    puts @last_name.to_s
  end

  def full_name
    puts @first_name.to_s + " #{@last_name}"
  end

  def add_course(course_name)
    if @list_course.include?(course_name)
      false
    else
      @list_course.push(course_name)
    end
  end

  def remove_course(course_name)
    if @list_course.include?(course_name)
      @list_course.delete(course_name)
      course_name
    else
      false
    end
  end

  def show
    @list_course
  end
end

student = Student.new
student.first_name = 'Alan'
student.last_name = 'Thompson'
student.first_name
student.last_name
student.full_name
student.add_course('Math')
student.add_course('Programming')
puts student.remove_course('New')
puts student.list_course

# ex 2
class Dictionary
  def initialize
    @dict = []
    @list = []
  end

  def add(vcb, decr)
    return if @list.include?(vcb)
    @list.push(vcb)
    @dict.push(vcb => decr)
  end

  def size
    @dict.size
  end

  def random
    @dict.sample
  end

  def remove(vcb)
    @dict.delete(vcb)
    @list.delete(vcb)
  end

  def update(vcb, decr)
    remove(vcb)
    add(vcb, decr)
  end
end

dict = Dictionary.new
dict.add('Hello', 'Xin chao')
dict.add('Goodbye', 'Tam biet')
p dict.random
p dict.size
dict.add('Love', 'Yeu')
dict.update('Hello', 'Chao')
dict.remove('Hello')
p dict
