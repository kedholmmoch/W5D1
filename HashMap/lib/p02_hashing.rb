class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash

    hash = 0
    self.each_with_index do |item, idx|
      hash += (item * idx).hash 
    end
    hash / (self.length + 1)
  end
end

class String
  def hash
    str_arr = self.split("").map { |char| char.ord }
    str_arr.hash

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    val_arr = []
    arr = self.keys + self.values
    arr.each do |ele|
      ele.to_s.each_char do |char|
        val_arr << char.ord
      end
    end
    val_arr.sum {|v| v.hash}
  end
end
