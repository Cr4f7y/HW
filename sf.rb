class Field

  def fill_empty()
    @array=Array.new(10) { |i| Array.new(10) { |i| 'O' }}
  end

  def fill_ships(empty)
    flag = 0
     loop do
      if empty[x=rand(9)][y=rand(9)]!="X" and
                           empty[x][y]!=1 and
                         empty[x][y+1]!=1 and
                        (empty[x][y+2]!=1 and empty[x][y+2]!=nil)

        empty[x][y] = "X"
        empty[x][y+1] = "X"
        empty[x][y+2] = "X"
        for i in x-1..x+1
          for j in y-1..y+3
            if empty[i][j]!="X" and i>=0 and j>=0 and y<=9
              empty[i][j] = 1
            end
          end
        end
        flag=flag+1
      end

      break if flag==2

    end
  end

end

  f1=Field.new
  array=f1.fill_empty
  f1.fill_ships(array)
              
  for i in 0..9
    for j in 0..9
      if j==9
        print array[i][j].to_s + "  \n"
      else
        print array[i][j].to_s + "  "
      end
    end
  end


