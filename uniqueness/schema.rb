require "bundler/setup"
require "active_record"

ActiveRecord::Base.establish_connection \
  adapter: $options.fetch(:database, "postgresql"),
  database: "examples"

ActiveRecord::Schema.define do
  create_table :settings, force: true do |t|
    t.string :name
    t.string :value

    t.index [:name], unique: true
  end
end

class Setting < ActiveRecord::Base
end
