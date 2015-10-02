def findElement(element,massive,&closure)
  for i in massive
    if (closure != nil)
    k = yield i, element
    if(k==true)
      return true
    end
    else
      if(element==i)
        return true
      end
    end
  end
  return false
end

def main()
  mass = [3,4,5,7,10]
  res = findElement(30,mass){|a,b| a==b+1}
  puts res
end
main()