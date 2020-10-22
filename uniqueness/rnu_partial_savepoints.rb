class Setting
  def self.for_name(name)
    sp_name = "create_setting_#{name}"

    transaction do
      connection.create_savepoint(sp_name)
      create(name: name)
    rescue ActiveRecord::RecordNotUnique
      connection.rollback_to_savepoint(sp_name)
      find_by(name: name)
    end
  end

  def self.set_value(name, value)
    for_name(name).update(value: value)
  end
end
