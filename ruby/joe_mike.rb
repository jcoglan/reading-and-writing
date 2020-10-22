require_relative "./actor"

class Joe
  def hello(joe, mike)
    puts "starting Joe.hello"
    mike.send(:hello, joe)
    puts "finishing Joe.hello"
  end

  def interrupt
    puts "INTERRUPTING JOE"
  end
end

class Mike
  def hello(joe)
    joe.send(:interrupt)
  end
end

joe  = Actor.new(Joe.new)
mike = Actor.new(Mike.new)

joe.send(:hello, joe, mike)

joe.wait
