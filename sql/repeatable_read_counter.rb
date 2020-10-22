def inc_counter
  ActiveRecord::Base.transaction(isolation: :repeatable_read) do
    ctr = Counter.find_by(name: "my-counter")
    ctr.update(value: ctr.value + 1)
  end
rescue ActiveRecord::SerializationFailure
  retry
end
