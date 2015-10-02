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

class Line
  attr_accessor :pbegin, :pend
  def initialize(pbegin,pend)
    @pbegin=pbegin
    @pend=pend
  end

  def distance()
    return @pbegin.distance(@pend)
  end

end
class HorizontalLine < Line
  def initialize(pbegin,pend)
    if (pbegin.y==pend.y)
      super(pbegin,pend)
    end
  end
end
class CrossLine
  attr_accessor :line1,line2
  def initialize(line1,line2)
    @line1=line1
    @line2=line2
  end


end

def main()
  p1=Point.new(1,2)
  p2=Point.new(3,4)
  line1 = Line.new(p1,p2)
  p3=Point.new(5,6)
  p4=Point.new(7,8)
  line2=Line.new(p3,p4)
  cl=CrossLine.new(line1,line2)
end