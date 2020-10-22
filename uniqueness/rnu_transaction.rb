class Setting
  def self.set_value(name, value)
    transaction(requires_new: true) do
      create(name: name, value: value)
    end
  rescue ActiveRecord::RecordNotUnique
    where(name: name).update_all(value: value)
  end
end

# note: deadlock if `requires_new` is omitted
