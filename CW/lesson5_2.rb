class Cottage
  attr_accessor :roof,:walls,:basement
  def initialize
    @roof=""
    @walls=""
    @basement=""
  end
end


class Boss
  def initialize(builder)
    @builder=builder

  end

  def create
    @builder.createBasement()
    @builder.createWalls()
    @builder.createRoof()
  end
end

class CottageBuilder
  def initialize()
    @cottage=Cottage.new

  end
  def createBasement()
    @cottage.basement="Basement"

  end
  def createWalls()
    @cottage.walls="Walls"
  end
  def createRoof()
    @cottage.roof="Roof"
  end
  def getBuilding()
    return @cottage
  end

end

def main
  builder= CottageBuilder.new()
  boss=Boss.new(builder)
  boss.create()
  cottage=builder.getBuilding
end
