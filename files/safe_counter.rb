filename = "counter.txt"

threads = (1..4).map do
  Thread.new do
    100.times do
      begin
        flags = File::RDWR | File::CREAT | File::EXCL
        lock = File.open("#{filename}.lock", flags)
      rescue Errno::EEXIST
        retry
      end
      tmp = File.read(filename).strip.to_i
      lock.puts("#{tmp + 1}")
      lock.close
      File.rename("#{filename}.lock", filename)
    end
  end
end

threads.each(&:join)
puts File.read(filename)
