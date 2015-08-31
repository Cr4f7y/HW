def main()
puts("Type a number:")
a=gets.to_i
#mask for 3&10 bits 0
b=0b0111111011
#mask for 3&10 bits 1
c=0b1000000100

puts "3&10 bits are 0: " , a&b
puts "3&10 bits are 1: " , a|c

end
main()