filename = "counter.txt"

threads = (1..4).map do
  Thread.new do
    100.times do
      tmp = File.read(filename).strip.to_i
      content = "#{tmp + 1}\n"
      File.write(filename, content)
    end
  end
end

threads.each(&:join)
puts File.read(filename)
