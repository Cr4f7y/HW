class Class
  @@instance=nil
  alias oldNew new
  def new(*args)
    if(self.name=="Singleton")
      if @@instance==nil
        @@instance = oldNew(*args)
      else
        return @@instance
      end
    end
    return oldNew(*args)
  end
end
class Singleton
    attr_accessor :value

  def initialize(a)
    @value=a
  end
end

def main()
  s=Singleton.new(10)
  s1=Singleton.new(20)
  print(s1.value)
end
main()