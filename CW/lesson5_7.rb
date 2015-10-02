class Picture
  def initialize(name)
    @name=name
  end
  def show()
    puts @name
  end
end

class Frame
  def initialize(p)
    @subject=p
  end
  def show()
    @subject.show()
    puts "frame"
  end
end

class Pattern
  def initialize(p)
    @subject=p
  end
  def show()
    @subject.show()
    puts "pattern"
  end
end

def main()
  picture = Picture.new("picaso")
  pictureInFrame=Frame.new(picture)
  pictureInFrameWithPattern=Pattern.new(pictureInFrame)
  pictureInFrameWithPattern.show()
end
main()