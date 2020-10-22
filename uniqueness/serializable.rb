ActiveRecord::Schema.define do
  change_table(:settings) { |t| t.remove_index [:name] }
end

class Setting
  def self.set_value(name, value)
    transaction(isolation: :serializable) do
      setting = find_or_create_by(name: name)
      setting.update(value: value)
    end
  rescue ActiveRecord::SerializationFailure
    retry
  end
end
