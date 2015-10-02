def hanoy(n,a,b,c)
  if (n>0)
    hanoy(n-1,a,c,b)
    puts "take " + n.to_s + " from " +a+ " to " +c
    hanoy(n-1,b,a,c)
  end
end

def main()
  hanoy(3,'a','b','c')

end
main()