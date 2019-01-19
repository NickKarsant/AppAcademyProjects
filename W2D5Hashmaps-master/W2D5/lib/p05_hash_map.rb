require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    linked_list(key).include?(key)
  end

  def set(key, val)
    if !include?(key)
      linked_list(key).append(key,val)
    else 
      delete(key)
      linked_list(key).append(key,val)
    end

    @count += 1 

    if @count == @store.size 
      resize!
    end
  end

  def get(key)
    linked_list(key).get(key)
  end

  def [](key)
    get(key)
  end

  def []=(key,val)
    set(key,val)
  end

  def delete(key)
    linked_list(key).remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |link_list|
      current_node = link_list.first 
      until current_node == link_list.tail 
        prc.call(current_node.key, current_node.val)
        current_node = current_node.next
      end
    end
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  # alias_method :[], :get
  # alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = @store 
    @store = Array.new(new_arr.size * 2) {LinkedList.new}
    @count = 0 
    
    new_arr.each do |link_list|
      link_list.each do |node|
        set(node.key,node.val) unless node.key == nil
      end
    end

  end

  def linked_list(key)
    i = key.hash % num_buckets 
    @store[i]
  end
end
