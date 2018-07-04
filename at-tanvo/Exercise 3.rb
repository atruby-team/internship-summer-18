lecturer = Array.new
lecturer = [
  { name:'Paul Barry',
    areas_of_interest: ['Programming','Networking','Security','Open Source','Frameworks']
  },
  { name:'Chris Meudec',
    areas_of_interest: ['Testing','Safety Systems','Formal Systems','Programming Languages']
  },
  { name:'Nigel Whyte',
    areas_of_interest: ['Graphics, Imaging','Programming','Sign Language','Trees']
  },
  { name:'Austin Kinsella',
    areas_of_interest: ['Networks','WANs','Programming','Macintosh','Digital Photography']
  },
  { name:'Gerry Moloney',
    areas_of_interest: ['Placement','Employment','Emerging Systems','Web Development']
  }
]
puts lecturer
#Show list areas of interest of the first and third lecturers.
puts lecturer[0][:areas_of_interest]
puts lecturer[2][:areas_of_interest]
#Remove the last lecturer
lecturer.delete_at(4)
puts lecturer
#Change lecturer name from Austin Kinsella to Howard Williams
lecturer.each do |n|
  n[:name] = 'Howard Williams' if n[:name] = 'Austin Kinsella'
end 
puts lecturer

