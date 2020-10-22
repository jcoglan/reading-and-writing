class Setting
  def self.set_value(name, value)
    create(name: name, value: value)
  rescue ActiveRecord::RecordNotUnique
    where(name: name).update_all(value: value)
  end
end
