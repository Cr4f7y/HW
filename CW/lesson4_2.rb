class Point
  attr_accessor :x, :y

  def initialize(x,y)
    @x=x
    @y=y
  end
  def distance(p)
    return sqrt((@x-p.x)*(@x-p.x)+(@y-p.y)*(@y-p.y))
  end
end

class Circle
  def initialize(p,radius)
    @center = p
    @radius = radius
  end
end


class Circle < Point
  def initialize
    super(p.x,p.y)
    @radius = radius
  end
end