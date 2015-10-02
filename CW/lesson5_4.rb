class A
  attr_accessor :value

  def initialize(value,massive)
    @value=value
    @massive=massive
  end

  def addElement(element)
    @massive.push(element)
  end
  def getMassive
    return @massive
  end
  def clone()
    newmassive=[]
    for element in @massive
      newmassive.push (element)
    end
    newObject=A.new(@value,newmassive)
    return newObject
  end
end

def main
  mass=[1,2,3]
  pa=A.new(10,mass)
  pa1=pa.clone()
  pa.value=20
  pa.addElement(4)
  print (pa.getMassive)
  print (pa1.getMassive)
end
main()