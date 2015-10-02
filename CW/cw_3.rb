def region (i,j,myMap)
myMap[i][j]=2
 if(j+1<myMap[i].size() and myMap[i][j+1] == 1)
   region(i,j+1,myMap)
 end
  if(j-1>=0 and myMap[i][j-1]==1)
    region(i,j-1,myMap)
  end
  if(i+1<myMap.size and myMap[i+1][j]==1)
    region(i+1,j,myMap)
  end
  if(i-1>=0 and myMap[i-1,j]==1)
    region(i-1,j,myMap)
  end
end
  def count(myMap)
  coun =0
  for i in 0...myMap.size()
    for j in 0...myMap[i].size()
        if(myMap[i][j]==1)
        coun+=1
        region(i,j,myMap)
        end
    end
  end
  return coun
  end
def main()
  myMap[[0,0,0,0,0,0],[0,0,1,1,0,1]]


end