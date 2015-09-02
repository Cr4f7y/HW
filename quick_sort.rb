def quick_sort(array)
  return array if array.length <= 1

  pivot_index = (array.length / 2).to_i
  pivot_value = array[pivot_index]
  array.delete_at(pivot_index)

  lesser = Array.new
  greater = Array.new

  array.each do |x|
    if x <= pivot_value
      lesser << x
    else
      greater << x
    end
  end

  return quick_sort(lesser) + [pivot_value] + quick_sort(greater)
end

a=[2,3,1,4,5,0,0]
p quick_sort(a)
