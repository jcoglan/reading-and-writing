def inc_counter
  Counter.where(name: "my-counter").update_all("value = value + 1")
end
