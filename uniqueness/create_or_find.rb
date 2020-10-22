class Setting
  def self.set_value(name, value)
    setting = create_or_find_by(name: name)
    setting.update(value: value)
  end
end
