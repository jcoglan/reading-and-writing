class Actor
  def initialize(object)
    @object  = object
    @mailbox = Queue.new

    @thread = Thread.new do
      loop do
        message = @mailbox.shift
        @object.__send__(*message)
      end
    end
  end

  def send(*message)
    @mailbox.push(message)
  end

  def wait
    @thread.join
  end
end
