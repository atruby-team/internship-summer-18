# Write a Ruby data structure to hold this data.
teachers = [
  {
    name: 'Paul Barry',
    areas_of_interest: ['Programming', 'Networking', 'Security', 'Open Source', 'Framework']
  },
  {
    name: 'Chris Meudec',
    areas_of_interest: ['Testing', 'Safety Systems', 'Formal Systems', 'Open Source', 'Programming Languages']
  },
  {
    name: 'Nigel Whytec',
    areas_of_interest: ['Graphics', 'Imaging', 'Programming', 'Sign Language', 'Trees']
  },
  {
    name: 'Austin Kinsella',
    areas_of_interest: ['Networks', 'WANs', 'Programming', 'Macintosh', 'Digital Photography']
  },
  {
    name: 'Gerry Moloney',
    areas_of_interest: ['Placement', 'Employment', 'Emerging Systems', 'Web Development']
  }
]

# Show list areas of interest of the first and third lecturers.
puts teachers.first[:areas_of_interest] if teachers.first
puts teachers[2][:areas_of_interest] if teachers[2]

# Remove the last lecturer
teachers.pop

# Change lecturer name from Austin Kinsella to Howard Williams
teachers.each do |teacher|
  teacher[:name] = 'Howard Williams' if teacher.value?('Austin Kinsella')
end

# Prints Lecture Name, who interest in Programming
teachers.each do |teacher|
  puts "Teacher: #{teacher[:name]}" if teacher[:areas_of_interest].include?('Programming')
end

# Change areas of interest Programming to Developing
teachers.each do |teacher|
  teacher[:areas_of_interest].map! { |obj| obj == 'Programming' ? 'Developing' : obj }
end

# Get distince interest
interests = []

teachers.each do |teacher|
  interests += teacher[:areas_of_interest]
end

interests.uniq!

puts interests
