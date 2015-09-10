def insert_sort(array)
  for i in 1..(array.length - 1)
    value = array[i]
    j = i - 1

    while yield j, array[j],value
      array[j + 1] = array[j]
      j -= 1
    end
    array[j + 1] = value
  end
  array
end


a=[2,3,1,4,5,0,0]
p insert_sort(a){|k,x,y| k>=0 and x>y }
