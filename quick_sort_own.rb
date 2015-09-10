def quick_sort(array,from=0,to=nil)
if to == nil
  to=array.size-1
end

return array if from>=to

  pivot = array[to]
  wall = from

  for i in from..to
    if array[i]<pivot

      temp=array[wall]
      array[wall]=array[i]
      array[i]=temp
      wall=wall +1

    end

  end
  if array[wall]>pivot
    array[to]=array[wall]
    array[wall]=pivot
  end

  quick_sort(array,from,wall-1)
  quick_sort(array,wall+1,to)


end

a=[7,2,1,6,8,5,3,4,2,1,2,3,1,0]
p quick_sort(a)
