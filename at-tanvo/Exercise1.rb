add = ->(*arr) { arr.inject { |i, y| i + y } }
sub1 = ->(*arr) { arr.inject { |i, y| i - y } }
multi = ->(*arr) { arr.inject { |i, y| i * y } }
div = lambda { |*arr|
  if arr.slice(1, arr.length).include? 0
    'Khong chia duoc'
  else
    arr.inject { |i, y| i / y }
  end
}
puts add.call(5, 4, 3, 4, 5, 6, 7)
puts sub1.call(9, 4, 5)
puts multi.call(5, 4)
puts div.call(20, 5, 2)
