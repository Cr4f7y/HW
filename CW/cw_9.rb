class Table

  #attr_accesor
  @@count = 0
  def initialize(high,width,length)
    @high=high
    @width=width
    @length=length
    @@count+=1
  end

  def self.GetCount()

    return @@count

  end

  def square()
    return @width*@length
  end

  def high=(high)
    @high=high
  end
  def high()
    return @high
  end


end
class OtherTable < Table
  attr_accessor :color
  def initialize(high,width,length,color)
    super(high,width,length)
    @color=color
  end

end
def main
  mynewtable = OtherTable.new(10,20,30,2)
  res = mynewtable.square()
  puts res
end
main()
