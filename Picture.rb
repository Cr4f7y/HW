class Plane
  attr_accessor :windows,:wings,:tail,:body
  def initialize
    @windows=""
    @wings=""
    @tail=""
    @body=""
  end
end


class Boss
  def initialize(builder)
    @builder=builder

  end

  def create
    @builder.createWings()
    @builder.createTail()
    @builder.createBody()
    @builder.createWindows()
  end
end

class PlaneBuilder
  def initialize()
    @plane=Plane.new

  end
  def createWings()
    @plane.wings="Wings"

  end
  def createWindows()
    @plane.windows="Windows"
  end
  def createBody()
    @plane.body="Body"
  end
  def createTail()
    @plane.tail="Tail"
  end
  def getBuilding()
    return @plane
  end

end

def main()
  builder = PlaneBuilder.new
  boss=Boss.new(builder)
  boss.create
  p plane=builder.getBuilding
end

main

