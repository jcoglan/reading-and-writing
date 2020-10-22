ActiveRecord::Schema.define do
  change_table(:settings) { |t| t.remove_index [:name] }
end

class Setting
  def self.set_value(name, value)
    transaction do
      setting = lock.find_or_create_by(name: name)
      setting.update(value: value)
    end
  end
end
