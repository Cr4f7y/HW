class Cell
  attr_accessor :status
  def initialize()
    @status = status
  end
end

class Field
  def fill_empty() #fill an array with 'O'
    @array= Array.new(14) { |cell=Cell.new| Array.new(14) { |cell| 'O' }}
  end

  def fill_ships(empty) #fill an array with 3-blocked ships "XXX" placed randomly
    for ship_size in 1..2
    flag = 0
    try = 0
    x=rand(10-ship_size)
    y=rand(10-ship_size)
        loop do
            success = false
            while success != true #trying to place 1 ship
              for count in 0..ship_size-1
                        success = false
                        if empty[x][y+count]!="X" and empty[x][y+count]!= 1
                           success = true
                        end

                        if success == false
                          x=rand(10-ship_size)
                          y=rand(10-ship_size)
                          try+=try
                        end
              end
              return "Error" if try>100
            end

              for draw in 0..ship_size-1
                empty[x][y+draw]="X"
              end

            for i in x-1..x+1   #creating a mask of "1" around a ship which is placed
              for j in y-1..y+ship_size
                if empty[i][j]!="X" and i>=0 and j>=0
                  empty[i][j] = 1
                end
              end
            end
            if empty[x][y]=="X"
            flag=flag+1
            end
            break if flag==5-ship_size #when 2 ships are placed break.

          end
        end
      end
end

  f1=Field.new #creating an object of a class Field

  array=f1.fill_empty #fill an array with 'O'
  f1.fill_ships(array) #adding ships to the array
  print array
  for i in 0..9 #formatted output of the array.
    for j in 0..9
      if j==9
        print array[i][j].to_s + "  \n"
      else
        print array[i][j].to_s + "  "
      end
    end
  end

