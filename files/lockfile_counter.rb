class Lockfile
  def initialize(filename)
    @filename = filename
    @lockname = "#{filename}.lock"
    @lock     = nil
  end

  def lock
    return if @lock

    flags = File::RDWR | File::CREAT | File::EXCL
    @lock = File.open(@lockname, flags)
  rescue Errno::EEXIST
    retry
  end

  def read
    raise "#{@filename} is not locked" unless @lock
    File.read(@filename)
  end

  def write(data)
    @lock.write(data)
  end

  def commit
    @lock.close
    File.rename(@lockname, @filename)
    @lock = nil
  end
end

filename = "counter.txt"

threads = (1..4).map do
  Thread.new do
    100.times do
      lockfile = Lockfile.new(filename)
      lockfile.lock
      tmp = lockfile.read.strip.to_i
      lockfile.write("#{tmp + 1}\n")
      lockfile.commit
    end
  end
end

threads.each(&:join)
puts File.read(filename)
