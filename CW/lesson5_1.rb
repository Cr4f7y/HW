class Triangle
  def initialize(line1,line2,line3)
    @line1=line1
    @line2=line2
    @line3=line3
  end

  def square()
    return 0
  end

end

class TriangleFactory
  def self.createTriangle(line1,line2,line3)
    if(line+line2>=line3)
      return  Triangle.new(line1,line2,line3)
    end
    return nil
  end
end

def main()
  t=TriangleFactory.createTriangle(10,15,20)
end