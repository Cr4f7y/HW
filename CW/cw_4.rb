def method()
  for i in 0..10
    for j in 0..10
      yield i,j
  end
  end
end

def main()
 method() {|a,b| puts b; puts a}
end
main()
