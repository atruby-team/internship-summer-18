list_lecturer = {
  1 => { name: 'Paul Barry', areas: ['Programming', 'Networking', 'Security', 'Open Source', 'Frameworks'] },
  2 => { name: 'Chris Meudec', areas: ['Testing', 'Safety Systems', 'Formal Systems', 'Programming Languages'] },
  3 => { name: 'Nigel Whyte', areas: ['Graphics', 'Imaging', 'Programming', 'Sign Language', 'Trees'] },
  4 => { name: 'Austin Kinsella', areas: ['Networks', 'WANs', 'Programming', 'Macintosh', 'Digital Photography'] },
  5 => { name: 'Gerry Moloney', areas: ['Placement', 'Employment', 'Emerging Systems', 'Web Development'] }
}

one = list_lecturer.dig(1, :areas)
three = list_lecturer.dig(3, :areas)

one.each { |obj| puts "Interest: #{obj}" }
three.each { |obj| puts "Interest: #{obj}" }

list_lecturer.delete(list_lecturer.to_a.last[0])
list_lecturer.dig(4)[:name] = 'Howard Williams'
puts list_lecturer
