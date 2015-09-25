class Cell
  attr_accessor :status
  def initialize(status)
    @status = status
  end
end

class Area
  def initialize(field_size_x,field_size_y)
    @field_size_x , @field_size_y = field_size_x , field_size_y
    @array= Array.new(@field_size_x) { |i| Array.new(@field_size_y) { |cell| cell = Cell.new('O') }}
  end

  def fill_area_at(x,y,to_x,to_y,status)
    for cur_x in ([x, 0].max)..([to_x,@field_size_x-1].min)
      for cur_y in ([y, 0].max)..([to_y,@field_size_y-1].min)
        @array[cur_x][cur_y].status = status
      end
    end
  end

  def check_area_at(x,y,to_x,to_y,status)
    for cur_x in ([x, 0].max)..([to_x,@field_size_x-1].min)
      for cur_y in ([y, 0].max)..([to_y,@field_size_y-1].min)
        return false if @array[cur_x][cur_y].status!=status
      end
    end
    return true
  end

  def print_area
    puts #print " \n"
    @array.each do |row|
      s=''
      row.each do |cell|
        s += cell.status.to_s + ' '
      end
      puts s #print " \n"
    end
  end
end

class Ship
  attr_accessor :name
  def initialize(name)
    @name = name
    @cells = Array.new()
  end

  def add_cell(cell)
    @cells << cell
  end

  def print
    puts @name
    s=''
    @cells.each do |cell|
      s += cell.status.to_s
    end
    puts s
  end
  def check_killed(status,mark)
    response = ''
    @cells.each do |cell|
      if cell.status == status
        response = 'To target!'+@name
        cell.status = mark
        break
      end
    end
    if response != ''
      killed = true
      @cells.each do |cell|
        if cell.status != mark
          killed = false
          break
        end
      end
    end
    if killed
      response = 'Killed!'+@name
#			puts response
      return -1
    else
      if response != ''
#				puts response
        return 1
      end
    end
    return 0
  end
end

class Field < Area

  def initialize(field_size)
    super(field_size,field_size)
    @ships = Array.new()
    @ship_number = 0
  end

  def add_ship(x,y,to_x,to_y)
    @ship_number+=1
    new_ship = Ship.new('Ship #'+@ship_number.to_s)
    for cur_x in x..to_x
      for cur_y in y..to_y
        new_ship.add_cell(@array[cur_x][cur_y])
        #puts "Adding cell at:"+cur_x.to_s+'-'+cur_y.to_s
      end
    end
    @ships << new_ship
    #@ships.last.print
  end

  def print_ships
    @ships.each do |ship|
      ship.print
      #puts
    end
  end

  def put_shot_at(x,y,status, skip_mark_damaged)
    if @array[x][y].status!= skip_mark_damaged
      @array[x][y].status= status
    end
  end

  def check_killed(status,mark)
    check = 0
    @ships.each do |ship|
      check = ship.check_killed(status,mark)
      break if check == 1 # Damaged
      if check ==-1		# Killed
        puts ship.name+' have been deleted!'
        @ships.delete(ship)
        check = 100 if @ships.size == 0	#  all ships killed
        break
      end
    end
    return check # 100- Game over; -1 - ship killed; 1 - ship damaged; 0 - mimo
  end

  def fill_ships #fill an array with 3-blocked ships "XXX" placed randomly
    4.downto(1) do |ship_size|
      ship_cnt = 5-ship_size
      begin
        horizontaly = (rand(2)==0)
        retries = 0
        begin
          #success = true
          if horizontaly
            x=rand(@field_size_x)
            y=rand(@field_size_y+1-ship_size)
          else
            x=rand(@field_size_x+1-ship_size)
            y=rand(@field_size_y)
          end

          # this block is to output each iteration of placing ship
          #puts "X=" + x.to_s
          #puts "Y=" + y.to_s
          #puts "ship_size=" + ship_size.to_s
          #puts "ship_cnt =" + ship_cnt.to_s
          #t = @array[x][y].status
          #@array[x][y].status = '='
          #self.print_area
          #@array[x][y].status = t
          # have to be deleted

          if horizontaly
            to_x = x
            to_y = y+ship_size-1
          else
            to_y = y
            to_x = x+ship_size-1
          end
          success = self.check_area_at(x,y,to_x,to_y,'O')

          horizontaly = !horizontaly if not success # changing orientation when not success

          retries +=1
          return "Error!" if retries > 1000
        end while not success # the same - until success
        self.fill_area_at(x-1,y-1,to_x+1,to_y+1,'1')	# fill '1' around and under ship
        self.fill_area_at(x,y,to_x,to_y,'X')			# fill 'X' under ship
        #self.print_area

        self.add_ship(x,y,to_x,to_y)
        #@ships.last.print_ship

        ship_cnt -= 1
      end while ship_cnt > 0
    end
    return "Ships on the field!"
  end

end

f1=Field.new(10) #creating an object of a class Field
f2=Field.new(10) #fill an array with 'O'
puts f1.fill_ships #adding ships to the array
f1.print_area
#f1.print_ships
for i in 1..100
  x = rand(10)
  y = rand(10)
  puts 'Shot at x:'+x.to_s+' y:'+y.to_s
  f1.put_shot_at(x,y,'+','#')
  case f1.check_killed('+','#') # 100- Game over; -1 - ship killed; 1 - ship damaged; 0 - mimo
    when 1
      puts 'Damaged!'
    when 0
      puts 'You are looser!'
    when -1
      puts 'Ship killed!'
    else
      break
  end
  f1.print_area
  #f1.print_ships

end
puts 'Game over!'