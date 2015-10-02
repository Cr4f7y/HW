class Quadrangle
  def initialize(line1,line2,line3,angle1,angle2)
    @line1=line1
    @line2=line2
    @line3=line3
    @angle1=angle1
    @angle2=angle2

  end
end

class Parallelogram < Quadrantial
  def initialize(line1,line2,angle)
    super(line1,line2,line1,angle,180-angle)
  end
end


class Rhombus < Parallelogram
  def initialize(line1,angle)
    super(line,line,angle)
  end
end

class Rectangle < Parallelogram
  def initialize(line1,line2)
    super(line1,line2,90)

  end
end

class Square < Rhombus
  include 'lesson4_5.rb'
  def initialize(line)
    super(line,90)
    end
end