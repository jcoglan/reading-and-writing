require "bundler/setup"
require "redis"

redis = Redis.new
redis.set("counter", 0)

threads = (1..4).map do
  Thread.new do
    100.times do
      redis.incr("counter")
    end
  end
end

threads.each(&:join)
puts "counter: #{redis.get("counter")}"
