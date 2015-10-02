def method(a,b,f)
  return f.call(a,b)
end


def main()
  f=lambda {|a,b| puts a+b}
  res = method(10,20,f)
  puts res
end
main()