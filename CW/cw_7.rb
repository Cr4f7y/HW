def f1(a,b)
  def f2(c,d)
    return c+d
  end
  return f2(a,b)
end

def main()
  res=f1(30,40)
  puts res
end
main()