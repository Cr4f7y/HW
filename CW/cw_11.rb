class Point
  attr_accessor :x, :y
  def initialize(x,y)
    @x=x
    @y=y
  end
end

class Circle <Point
   def initialize (x,y,radius)

     super(x,y)
     @radius = radius

   end


end
class Circle2
  attr_accessor :point
  attr_accessor :radius
  def initialize(point,radius)
    @point=point
    @radius=radius
  end
end
def main()
  r=Circle.new(10,20,30)
  p=Point.new(10,20)
  r1=Circle2.new(p,30)
end