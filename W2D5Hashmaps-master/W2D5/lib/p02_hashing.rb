class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.join.to_i
  end
end

class String
  def hash
    self.chars.map {|ch| ch.ord.to_s}.join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = ""
    self.to_a.sort.each do |el|
      result += el[0].to_s + el[1].to_s
    end
    result.to_i
  end
end
