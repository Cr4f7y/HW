class Field

  def fill_empty() #fill an array with 'O'
    @array=Array.new(10) { |i| Array.new(10) { |i| 'O' }}
  end

  def fill_ships(empty) #fill an array with 3-blocked ships "XXX" placed randomly
    flag = 0
     loop do
      if empty[x=rand(9)][y=rand(9)]!="X" and #check if the current element[x][y(+1)(+2)]is not X or 1.
                         empty[x][y]!=1   and
                         empty[x][y+1]!=1 and
                        (empty[x][y+2]!=1 and empty[x][y+2]!=nil)# Last one checked if! nil.

        empty[x][y] = "X"
        empty[x][y+1] = "X"
        empty[x][y+2] = "X"
        for i in x-1..x+1   #creating a mask of "1" around a ship which is placed
          for j in y-1..y+3
            if empty[i][j]!="X" and i>=0 and j>=0 and y<=9
              empty[i][j] = 1
            end
          end
        end
        flag=flag+1
      end

      break if flag==2 #when 2 ships are placed break.

    end
  end

end

  f1=Field.new #creating an object of a class Field
  array=f1.fill_empty #fill an array with 'O'
  f1.fill_ships(array) #adding ships to the array
              
  for i in 0..9 #formatted output of the array.
    for j in 0..9
      if j==9
        print array[i][j].to_s + "  \n"
      else
        print array[i][j].to_s + "  "
      end
    end
  end

# Example an output
# O  O  O  O  O  O  O  O  O  O
# O  O  O  O  O  O  O  O  O  O
# O  O  O  O  O  O  O  O  O  O
# O  O  O  O  O  O  O  O  O  O
# O  O  O  O  O  O  O  O  O  O
# O  O  O  O  1  1  1  1  1  O
# 1  1  1  1  1  X  X  X  1  O
# X  X  X  1  1  1  1  1  1  O
# 1  1  1  1  O  O  O  O  O  O
# O  O  O  O  O  O  O  O  O  O
