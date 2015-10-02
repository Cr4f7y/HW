def func(n)
  if(n>0)
    return func(n-1)*n
  else
    return 1
  end
end

def main()
  res=func(3)
  p res

end
main()