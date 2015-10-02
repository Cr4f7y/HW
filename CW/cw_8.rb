class A
  def initialize()
    @a=0
    @b=0
  end
  def getA()
    return @a
  end
  def setA(aa)
    @a=aa
  end
end

def main()
  v = A.new
  v.setA(100)
  puts v.getA()

end
main()