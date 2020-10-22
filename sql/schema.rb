require "bundler/setup"
require "active_record"

ActiveRecord::Base.establish_connection \
  adapter: $options.fetch(:database, "postgresql"),
  database: "examples"

ActiveRecord::Schema.define do
  create_table :counters, force: true do |t|
    t.string :name, null: false
    t.integer :value, null: false, default: 0
  end
end

class Counter < ActiveRecord::Base
end
