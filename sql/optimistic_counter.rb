ActiveRecord::Schema.define do
  change_table :counters do |t|
    t.integer :lock_version, null: false
  end
end

def inc_counter
  ctr = Counter.find_by(name: "my-counter")
  ctr.update(value: ctr.value + 1)
rescue ActiveRecord::StaleObjectError
  retry
end
