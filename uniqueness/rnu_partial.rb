class Setting
  def self.for_name(name)
    create(name: name)
  rescue ActiveRecord::RecordNotUnique
    find_by(name: name)
  end

  def self.set_value(name, value)
    for_name(name).update(value: value)
  end
end
