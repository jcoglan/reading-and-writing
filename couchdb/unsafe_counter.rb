require "bundler/setup"
require "couchrest"

DB = "http://admin:admin@localhost:5984/examples"
CouchRest.put(DB)
CouchRest.put("#{DB}/counter", "value" => 0)

def inc_counter
  counter = CouchRest.get("#{DB}/counter")
  counter["value"] += 1
  CouchRest.put("#{DB}/counter", counter)
end

threads = (1..4).map do
  Thread.new do
    100.times { inc_counter }
  end
end

threads.each(&:join)
p CouchRest.get("#{DB}/counter")

CouchRest.delete(DB)
