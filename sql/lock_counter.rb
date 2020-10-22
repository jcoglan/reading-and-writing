def inc_counter
  ActiveRecord::Base.transaction do
    ctr = Counter.lock.find_by(name: "my-counter")
    ctr.update(value: ctr.value + 1)
  end
end
