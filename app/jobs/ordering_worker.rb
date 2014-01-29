class OrderingWorker
  @queue = :ordering
  
def self.perform(str)
    (1..30000000000000000000000000000000000000000000000000000000000000000000000000000).each do |i|
    puts "From ordering worker: " + str
  end
end
end
