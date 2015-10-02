class Flower
  attr_accessor :price, :freshness, :length

  def initialize(price,freshness,length)
    @price=price
    @freshness=freshness
    @length = length
  end
end

class Rose < Flower
  attr_accessor :type
  def initialize(price,freshness,length)
    super(price,freshness,length)
    @type = "rose"
  end
end

class Tulip < Flower
  attr_accessor :type
  def initialize(price,freshness,length)
    super(price,freshness,length)
    @type = "tulip"
  end
end

class Accessories
  attr_accessor :price
  def initialize(price)
    @price = price
  end
end

class Ribbon < Accessories
  def initialize(price,color)
    super(price)
    @color = color
    @type = "ribbon"
  end
end

class Bouquet

  def initialize
    @flowers= []
    @accessories=[]
  end

  def setFlower(f)
  @flowers.push(f)
  end

  def setAccessories(a)
    @accessories<<a
  end
  def sort()
    for i in 0...@flowers.size
      for j in i+1...@flowers.size()
         if (@flowers[i].freshness>@flowers[j].freshness)
           @flowers[i],@flowers[j] = @flowers[j],@flowers[i]
         end
      end
    end
  end
  def findFLower(minLength,maxLength)
    result=()
    for flower in @flowers
      if (flower.length>minLength and flower.length <maxLength)
        result << flower
      end
    end
  end
  def totalCost()
    res=0
    for flower in @flowers
      res+=flower.price
    end
    for a in @accessories
      res+=a.price
    end
    return res
  end
end

def main
  f1=Rose.new(100,34,60)
  f2=Rose.new(110,33,65)
  f3=Tulip.new(230,35,7)
  a = Ribbon.new(150,"red")
  b= Bouquet.new()
  b.setFlower(f1)
  b.setFlower(f2)
  b.setFlower(f3)
  b.setAccessories(a)
  puts b.totalCost()

end

main()