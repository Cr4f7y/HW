class A
  def initialize()
      show()
  end
  def show()
    puts("A")
  end
end

class B < A
  def initialize ()
  super()
  end
  def show()
    puts ("B")
  end
end

def main()
  p=B.new()
end
main()