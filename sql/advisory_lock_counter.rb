def inc_counter
  Counter.connection.execute("SELECT pg_advisory_lock(1)")
  ctr = Counter.find_by(name: "my-counter")
  ctr.update(value: ctr.value + 1)
  Counter.connection.execute("SELECT pg_advisory_unlock(1)")
end
