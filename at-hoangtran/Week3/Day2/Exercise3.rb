# Hold data
lecturers = [
  { lecturer: 'Paul Barry', subject: ['Programming', 'Networking', 'Security', 'Open Source', 'Frameworks'] },
  { lecturer: 'Chris Meudec', subject: ['Testing', 'Safety Systems', 'Formal Systems', 'Programming Languages'] },
  { lecturer: 'Nigel Whyte', subject: ['Graphics', 'Imaging', 'Programming', 'Sign Language', 'Trees'] },
  { lecturer: 'Austin Kinsella', subject: ['Networking', 'WANs', 'Programming', 'Macintosh', 'Digital Photography'] },
  { lecturer: 'Gerry Moloney', subject: ['Placement', 'Employment', 'Emerging Systems', 'Web Development'] }
]

# Show list areas of interest of the first and third lecturers
puts 'List areas of interest of the first:'
puts lecturers[0][:subject]
puts 'List areas of interest of the third:'
puts lecturers[2][:subject]

# Remove the last lecturer
puts 'Remove the last lecturer'
puts lecturers.delete_at(lecturers.length - 1)

# Change lecturer name from Austin Kinsella to Howard Williams
puts 'Change lecturer name from Austin Kinsella to Howard Williams'
lecturers.each do |x|
  x[:lecturer] = 'Howard Williams' if x[:lecturer] == 'Austin Kinsella'
end
puts lecturers
