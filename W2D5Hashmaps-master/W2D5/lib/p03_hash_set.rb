class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      self[key] << key 
      @count += 1 
    end

    if count == @store.size 
      resize!
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key) 
      @count -= 1 
    end
  end

  private

  def [](num)
    i = num.hash % @store.size
    @store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = @store 
    @store = Array.new(new_arr.size * 2) {[]}
    @count = 0 

    new_arr.each do |bucket|
      bucket.each do |el|
        insert(el)
      end
    end
  end
end
