def pyramid_sort(array,b,j)

        loop do

          swapped = false

          for i in 0..(array.size+1)/2.to_int

              #creating tree structure dependency  father array[0] => child array[1], child array[2]
                                                  #father array[1] => child array[3], child array[4] etc.
              k1=2*i+1
              k2=2*i+2

              if array[k1]!=nil and array[i]>array[k1] #comparing father and child[2i+1] till min is found

                array[i],array[k1]=array[k1],array[i]
                swapped = true
              end

              if array[k2]!=nil and array[i]>array[k2] #comparing father and child[2i+2] till min is found

                array[i],array[k2]=array[k2],array[i]

                swapped = true
              end

          end

            break if !swapped


        end

      array[0],array[array.size-1]=array[array.size-1],array[0]
      b[j]=array[array.size-1]
      j=j+1
      array.pop

      return b if array.size==0

      pyramid_sort(array,b,j)


end

a = [100,80,110,60,10,85,30,5]
b=Array.new(a.size)
j=0
p pyramid_sort(a,b,j)


