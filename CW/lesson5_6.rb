class Node
  attr_accessor :value, :next
  def initialize(value)
    @value=value
    @next=nil
  end
end

class List
  def initialize()
    @first=nil

  end

  def addElement(element)
    if @first==nil
      p=Node.new(element)
      @first=p
      return
    end
    temp=@first
    while(temp.next!=nil)
      temp=temp.next
    end
    p=Node.new(element)
    temp.next=p
  end
  def add(position,element)
    temp=@first
    for i in 0...position
      temp=temp.next
    end
    p=Node.new(element)
    p.next=temp.next
    temp.next=p
  end
  def delete(position)
    temp=@first
    for i in 0...position
      temp=temp.next
    end
    pop temp.next
  end
end