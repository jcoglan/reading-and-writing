def move_start_date(name)
  evt = Event.find_by(name: name)
  evt.update(starts_on: evt.starts_on + 2.days, ends_on: evt.ends_on)
end

def move_end_date(name)
  evt = Event.find_by(name: name)
  evt.update(starts_on: evt.starts_on, ends_on: evt.ends_on - 2.days)
end
