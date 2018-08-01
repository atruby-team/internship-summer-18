def non_reapeating
  a = 'asica'
  arr = a.split('')
  chua = []
  arr.each do |n|
    chua.push(arr.index(n)) if arr.count(n) == 1
  end
  return chua[0] if chua[0]
  -1
end
puts non_reapeating
