def inc_counter
  ctr = Counter.find_by(name: "my-counter")
  ctr.update(value: ctr.value + 1)
end
