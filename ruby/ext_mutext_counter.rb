class Counter
  attr_reader :value

  def initialize
    @value = 0
  end

  def inc
    @value += 1
  end
end

counter = Counter.new
mutex   = Mutex.new

threads = (1..4).map do
  Thread.new do
    1000.times do
      mutex.synchronize { counter.inc }
    end
  end
end

threads.each(&:join)

puts counter.value
