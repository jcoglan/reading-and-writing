require_relative "../shared/transactor"
require_relative "./schema"

require $options[:example]

100.times do |i|
  dates = { starts_on: 1.day.from_now, ends_on: 4.days.from_now }
  Event.create(name: "event-#{i}", **dates)

  threads = [
    Thread.new { t { move_start_date("event-#{i}") } },
    Thread.new { t { move_end_date("event-#{i}") } }
  ]

  threads.each(&:join)
end

p [:count, Event.count]
p [:valid, Event.count(&:valid?)]
