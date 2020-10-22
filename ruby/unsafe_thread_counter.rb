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

threads = (1..4).map do
  Thread.new do
    1000.times { counter.inc }
  end
end

threads.each(&:join)

puts counter.value
