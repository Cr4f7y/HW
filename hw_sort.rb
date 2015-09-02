def bubble_sort(array)

  counter = array.length
  loop do
    swapped = false

      (counter-1).times do |i|

        if array[i] > array[i+1]

       array[i],array[i+1] = array[i+1],array[i]
        swapped = true
        end

      end
      break unless swapped
  end
end
a=[2,3,1,4,5,0,0,1]
bubble_sort(a)
print (a)