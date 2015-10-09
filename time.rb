require 'benchmark'
class Sum
  attr_accessor :result
  def initialize(start,finish)
    @start=start
    @finish=finish
    @result=0
  end
  def execute
    for i in @start...@finish
      @result+=i
    end
  end
end

def main()
  # measurement = Benchmark.measure do
  #            for i in 0...1000
  #               s1=Sum.new(0,5000)
  #               s2=Sum.new(5000,10001)
  #               thread1=Thread.new(s1){|obj| obj.execute}
  #               thread2=Thread.new(s2){|obj| obj.execute}
  #               thread1.join()
  #               thread2.join()
  #               end
  # end
  #
  #   print measurement

  # measurement = Benchmark.measure do
  #   for i in 0...1000
  #     s1=Sum.new(0,10001)
  #
  #     thread1=Thread.new(s1){|obj| obj.execute}
  #
  #     thread1.join()
  #
  #   end
  # end
  #
  #   print measurement
  # #
  measurement = Benchmark.measure do
    for i in 0...1000
      s1=Sum.new(0,2500)
      s2=Sum.new(2500,5000)
      s3=Sum.new(5000,7500)
      s4=Sum.new(7500,10001)
      thread1=Thread.new(s1){|obj| obj.execute}
      thread2=Thread.new(s2){|obj| obj.execute}
      thread3=Thread.new(s3){|obj| obj.execute}
      thread4=Thread.new(s4){|obj| obj.execute}
      thread1.join()
      thread2.join()
      thread3.join()
      thread4.join()
    end
  end
  print measurement

end
main()