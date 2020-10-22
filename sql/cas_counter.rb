def inc_counter
  loop do
    ctr   = Counter.find_by(name: "my-counter")
    rows  = Counter.where(id: ctr.id, value: ctr.value)
    count = rows.update_all(value: ctr.value + 1)

    break if count > 0
  end
end
