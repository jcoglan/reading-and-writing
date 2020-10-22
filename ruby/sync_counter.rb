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
1000.times { counter.inc }

puts counter.value
