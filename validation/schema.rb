require "bundler/setup"
require "active_record"

ActiveRecord::Base.establish_connection \
  adapter: $options.fetch(:database, "postgresql"),
  database: "examples"

ActiveRecord::Schema.define do
  create_table :events, force: true do |t|
    t.string :name, null: false
    t.date :starts_on, null: false
    t.date :ends_on, null: false
  end
end

class Event < ActiveRecord::Base
  validate do
    unless starts_on <= ends_on
      errors.add(:base, "Events must start before they end")
    end
  end
end
