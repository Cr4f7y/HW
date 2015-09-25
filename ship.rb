class Cell
    attr_accessor :status
    def initialize()
      @status = status
    end
end

class Ship < Cell
  @@sells_count = 0
  def initialize
    @cells = Array.new
  end
  def add_cell( cell )
    cell = Cell.new
    cell.status = 'X'
    @cells << cell

  end
  def delete
    @cells.clear
    sells_count = 0
  end
end

class Field
  attr_accessor :field_size

  def initialize(field_size)
    @field_size = field_size
    @ships = Array.new

    retries = 100
    success = false
    # begin
    #   if self.fill_ships
    #     success = true
    #     break
    #   end
    #   retries -=1
    # end while retries>0
    # if not success #move
    #   puts "Sorry cannot put all ships on the field!"
    #   @ships.each{|ship| ship.delete}
    #   self.fill_field('0')
    # end

  end
  def fill_cell(field_size)
    @cells = Array.new(field_size) { |cell=Cell.new| Array.new(field_size) { |cell| 'O' }}
  end
   def fill_field(status)
    @cells.each{|row| row.each{|cell| cell.status=status} }
#		for row in 0...(@cells.length) 	#another way
#			for cell in 0...(row.length)
#				cell.status=status
#			end
#		end
  end

  def put_ship_at(x,y,ship_size,orientation,cells) # x,y in 1..10; size in 1..4;  orientation horizontal=0 or else - vertical
    from_x = x - 1 # cells array 0..9
    if x!=0 # not left edge of the field
      from_x -= 1
    end
    from_y = y - 1
    if y!=0 # not up edge of the field
      from_y -= 1
    end
    to_x = x - 1
    to_y = y - 1
    if orientation == 0 #'horizontal'
      if y < @field_size	# not bottom edge of the field
        to_y += 1
      end
      if to_x + ship_size< @field_size # not right edge of the field
        to_x += 1
      end
    else # orientation == 'vertical'
      if x < @field_size	# not right edge of the field
        to_x += 1
      end
      if to_y + ship_size< @field_size # not bottom edge of the field
        to_y += 1
      end
    end

    success = true # start checking
    cur_x = from_x
    begin
      for cur_y in from_y..to_y
        if cells[cur_x][cur_y] != 'O'
          success = false
          break
        end
      end
      cur_x +=1
    end while (success and (cur_x <= to_x))

    if success # put ship on field
      for cur_y in from_y..to_y # filling area with '1'
        for cur_x in from_x..to_x
          @cells[cur_x][cur_y] = '1'
        end
      end
      from_x = x - 1
      from_y = y - 1
      if orientation == 'horizontal'
        to_x   = from_x + ship_size -1
        to_y   = from_y
      else # orientation == 'vertical'
        to_y   = from_y + ship_size -1
        to_x   = from_x
      end

      @ships << Ship.new
      for cur_y in from_y..to_y
        for cur_x in from_x..to_x
          @ships.last.add_cell(@cells[cur_x][cur_y])
        end
      end


    end
    #return success
  end

  # def fill_ships
  #   4.downto(1){|ship_size|
  #     {
  #         ship_cnt = 5-ship_size
  #     begin
  #       retries = 100
  #       success = false
  #       x = 1+rand(10 - ship_size +1)
  #       y = 1+rand(10 - ship_size +1)
  #       p = rand(2)
  #       begin
  #         if self.put_ship_at(x,y,ship_size,p)
  #           success = true
  #           break
  #         end
  #         retries -=1
  #       end while retries>0
  #       if not success
  #         puts "Cannot put ship¹ " ,ship_cnt, " ship size" , ship_size," on the field! "
  #         break
  #       end
  #       ship_cnt -=1
  #     end while (ship_cnt>0)
  #     if not success
  #       break
  #     end
  #   }
  #   }
  #   return success
  # end
  #
  # def put_shot_at(x,y)
  #   #@cells[x-1][y-1].status='-'
  # end

end
array=Field.new(10)
array.fill_cell(10)
f1=array.put_ship_at(0,0,1,0,array)
puts f1
for i in 0..9 #formatted output of the array.
  for j in 0..9
    if j==9
      print f1[i][j] + "  \n"
    else
      print f1[i][j] + "  "
    end
  end
end


