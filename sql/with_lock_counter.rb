def inc_counter
  ctr = Counter.find_by(name: "my-counter")
  ctr.with_lock do
    ctr.update(value: ctr.value + 1)
  end
end
