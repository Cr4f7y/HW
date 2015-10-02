 class Sum
   def initialize(a,b)
     @a=a
     @b=b
   end
   
   def sum()
     print "ok"
     return @a+@b
   end
 end
 
 class Proxy
   @@lisA=[]
   @@lisB=[]
   @@lisRes=[]
   def initialize(a,b)
     @a=a
     @b=b

   end
   
   def sum()
     for i in 0...@@lisA.size
       if @@lisA[i]==@a and @@lisB[i]==@b
         return @@lisRes[i]
        end
       end
         
         s=Sum.new(@a,@b)
         res=s.sum()
         @@lisA.push(@a)
         @@lisB.push(@b)
         @@lisRes.push(res)
                
        end
   end
def main()
  p=Proxy.new(1,2)
  res=p.sum()
  print res
  p1=Proxy.new(1,2)
  res1=p1.sum()
end
 main