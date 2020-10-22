ActiveRecord::Schema.define do
  change_table :events do |t|
    t.integer :lock_version, null: false
  end
end

def move_start_date(name)
  evt = Event.find_by(name: name)
  evt.update(starts_on: evt.starts_on + 2.days, ends_on: evt.ends_on)
rescue ActiveRecord::StaleObjectError
end

def move_end_date(name)
  evt = Event.find_by(name: name)
  evt.update(starts_on: evt.starts_on, ends_on: evt.ends_on - 2.days)
rescue ActiveRecord::StaleObjectError
end
