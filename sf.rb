class Cell
  attr_accessor :status
  def initialize()
    @status = status
  end
end

class Field < Cell

  def initialize ()
    @array= Array.new(10) { |i| Array.new(10) { |i| 'O' }}
  end

  def fill_ships() #fill an array with 3-blocked ships "XXX" placed randomly
    for ship_size in 1..4
    flag = 0
    try = 0
    x=rand(10-ship_size)
    y=rand(10-ship_size)
        loop do
            success = false
            while success != true #trying to place 1 ship
              for count in 0..ship_size-1
                        success = false
                        puts "X=" + x.to_s
                        puts "Y=" + y.to_s
                        puts "ship_size=" + ship_size.to_s
                        if @array[x][y+count]!='X' and @array[x][y+count]!= '1'
                           success = true

                        end

                        if success == false

                          x=rand(10-ship_size)
                          y=rand(10-ship_size)
                          try=try+1
                          break

                        end

              end
              return puts "Error" if try > 1000

            end

              for draw in 0..ship_size-1
                @array[x][y+draw]='X'
              end

            for i in x-1..x+1   #creating a mask of "1" around a ship which is placed
              for j in y-1..y+ship_size
                if @array[i][j]!='X' and i>=0 and j>=0
                  @array[i][j] = '1'
                end
              end
            end
            if @array[x][y]=='X'
            flag=flag+1
            end
            break if flag==5-ship_size #when 2 ships are placed break.

          end
        end
  end

  def print_array()
    print "  \n"
    for i in 0..9 #formatted output of the array.
      for j in 0..9
        print @array[i][j].to_s + "  "
        if j==9
          print "  \n"
        end
      end
    end

  end
end

  f1=Field.new #creating an object of a class Field
  f2=Field.new #fill an array with 'O'
  f1.fill_ships #adding ships to the array
  f1.print_array
  f2.print_array





