require 'byebug'
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def inspect
    "#{self.object_id} #{self.key} - #{self.val} #{self.prev} #{self.next}"
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
     self.prev.next = self.next
     self.next.prev = self.prev
  end
end

class LinkedList
  include Enumerable
  attr_reader :tail, :head
  def initialize
    @head = Node.new
    @tail = Node.new 
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    current_node = first
    i.times do
        break if current_node == @tail 
        current_node = current_node.next
    end
    current_node == @tail ? nil : current_node
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    return false if last != @head 
    true
  end

  def get(key)
    each {|node| return node.val if key == node.key}
    nil
  end

  def include?(key)
    next_node = @tail.prev
    until next_node.key == @head.key
    return true if next_node.key == key
    next_node = next_node.prev
    end
    false
  end

  def append(key, val)
    unless include?(key)
      new_node = Node.new(key,val)
      new_node.prev = @tail.prev
      @tail.prev.next = new_node
      @tail.prev = new_node 
      new_node.next = @tail
    end

  end

  def update(key, val)
    each {|node| node.val = val if node.key == key}
  end

  def remove(key)
    each do |node|
      if node.key == key  
        node.prev.next, node.next.prev = node.next, node.prev
      end
    end
  end

  def each(&prc)
    current_node = first 
    until current_node == @tail
      prc.call(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
