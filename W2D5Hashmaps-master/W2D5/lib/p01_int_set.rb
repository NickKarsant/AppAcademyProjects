class MaxIntSet
  def initialize(max)
    @store = Array.new(max,false)
  end

  def insert(num)
    if num > -1 && num < @store.size 
      @store[num] = true 
    else 
      raise "Out of bounds"
    end
  end

  def remove(num)
    if num > -1 && num < @store.size 
      @store[num] = false 
    else 
      raise "Out of bounds"
    end
  end

  def include?(num)
    if num > -1 && num < @store.size 
      @store[num]
    else 
      raise "Out of bounds"
    end
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if include?(num)
      nil
    else 
      self[num] << num 
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
     self[num].include?(num)
  end

  private

  def [](num)
   i = num % @store.size 
   @store[i]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num] << num 
      @count += 1 
    end

    if count == @store.size 
      resize!
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num) 
      @count -= 1 
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    i = num % @store.size
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
