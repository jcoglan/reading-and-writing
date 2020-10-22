require_relative "../shared/transactor"
require_relative "./schema"

require $options[:example]

Counter.create(name: "my-counter")

threads = (1..4).map do
  Thread.new do
    100.times { t { inc_counter } }
  end
end

threads.each(&:join)
p Counter.find_by(name: "my-counter")

ActiveRecord::Base.logger = Logger.new(STDERR)
t { inc_counter }
