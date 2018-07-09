# Ruby data structure to hold this data.
arr = [
  { name: 'Paul Barry', interest: ['Programming', 'Networking', 'Security', 'Open Source', 'Frameworks'] },
  { name: 'Chris Meudec', interest: ['Testing', 'Safety Systems', 'Formal Systems', 'Programming Languages'] },
  { name: 'Nigel Whyte', interest: ['Graphics', 'Imaging', 'Programming', 'Sign Language', 'Trees'] },
  { name: 'Austin Kinsella', interest: ['Networks', 'WANs', 'Programming', 'Macintosh', 'Digital Photography'] },
  { name: 'Gerry Moloney', interest: ['Placement', 'Employment', 'Emerging Systems', 'Web Development'] }
]

# Show list areas of interest of the first and third lecturers.
puts 'List areas of interest of the first lecturers:'
puts arr[0][:interest]
puts 'List areas of interest of the third lecturers:'
puts arr[2][:interest]

# Remove the last lecturer.
arr.pop

# Change lecturer name from Austin Kinsella to Howard Williams
arr.each do |x|
  x[:name] = 'Howard Williams' if x[:name] == 'Austin Kinsella'
end

# Exercise addition
sum = 0
list = []

arr.each do |x|
  sum += 1 if x[:interest].include?('Programming')
  x[:interest].map! { |a| a == 'Programming' ? 'Web Developer' : a }
  list += x[:interest]
end

# List interest
list.uniq
