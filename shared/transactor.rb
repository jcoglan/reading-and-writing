require "optparse"

parser = OptionParser.new do |args|
  args.on("-e", "--example=FILE")
  args.on("-t", "--transaction[=LEVEL]")
  args.on("-d", "--database=DB")
end

$options = {}
parser.parse!(into: $options)

$levels = {
  "ru" => :read_uncommitted,
  "rc" => :read_committed,
  "rr" => :repeatable_read,
  "s"  => :serializable
}

def t(&task)
  if $options[:transaction]
    level = $levels[$options[:transaction]]
    ActiveRecord::Base.transaction(isolation: level, &task)
  elsif $options.key?(:transaction)
    ActiveRecord::Base.transaction(&task)
  else
    task.call
  end
rescue ActiveRecord::SerializationFailure
  retry
end
