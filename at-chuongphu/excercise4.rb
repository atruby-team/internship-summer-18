# ex1
array = 'asianstech'.split(' ') 
array.each do |x|
	puts array.index(x) if array.count(x) == 1
end    
# # ex2
def sumarr(a)
  check = a.all?{ |x| x.is_a? Integer }
  if check == true
   puts a.reduce(0, :+)
  else
   puts "nil"
 end
end
a = [1, 2, 4 ,5]
sumarr(a)
# ex4
human_name = 'alan john'
final = human_name.split.map(&:capitalize).join(' ')
puts final
