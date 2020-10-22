def inc_counter
  ctr = Counter.find_by(name: "my-counter")
  tmp = ctr.value

  ctr.with_lock do
    ctr.update(value: tmp + 1)
  end
end
