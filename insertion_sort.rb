def insertion_sort(array)
  array.each_with_index do |el,i|
    j = i - 1
    while j >= 0
      break if array[j] <= el
      array[j + 1] = array[j]
      j -= 1
    end
    array[j + 1] = el
  end
end
a=[2,3,1,4,5,0,0]
p insertion_sort(a)
