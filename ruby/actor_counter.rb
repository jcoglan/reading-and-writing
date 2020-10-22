require_relative "./actor"

class Counter
  attr_reader :value

  def initialize
    @value = 0
  end

  def inc
    @value += 1
  end

  def get(sender)
    sender.send(:puts, @value)
  end
end

counter = Actor.new(Counter.new)
main    = Actor.new(self)

1000.times { counter.send(:inc) }

counter.send(:get, main)
main.wait
