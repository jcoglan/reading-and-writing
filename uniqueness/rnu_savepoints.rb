class Setting
  def self.set_value(name, value)
    sp_name = "create_setting_#{name}"

    transaction do
      connection.create_savepoint(sp_name)
      create(name: name, value: value)
    rescue ActiveRecord::RecordNotUnique
      connection.rollback_to_savepoint(sp_name)
      where(name: name).update_all(value: value)
    end
  end
end
