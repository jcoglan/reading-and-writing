require_relative "../shared/transactor"
require_relative "./schema"

require $options[:example]

def set_value(name, value)
  t { Setting.set_value(name, value) }
end

threads = (1..4).map do |n|
  Thread.new do
    set_value("site_url", "http://www#{n}.example.com/")
  end
end

threads.each(&:join)
p [:count, Setting.count]

ActiveRecord::Base.logger = Logger.new(STDERR)
(1..2).each { |n| p [:n, n] ; set_value("timezone", "UTC+#{n}") }

p [:last]
p Setting.last
