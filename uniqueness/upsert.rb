class Setting
  def self.set_value(name, value)
    if $options[:database] == "mysql"
      upsert({ name: name, value: value })
    else
      upsert({ name: name, value: value }, unique_by: [:name])
    end
  end
end
