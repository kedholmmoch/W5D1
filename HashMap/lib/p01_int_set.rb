class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max,false)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num > @max
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
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
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
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
    if !self[num].include?(num)
      self[num] << num 
      @count += 1
      resize! if count >= @store.length
    end
    #@count = @store.count { |a| a != []}
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
   self[num].include?(num)
  end

  private

  def [](num)
     @store[num % @store.length]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      @store.length.times do
        @store << Array.new
      end

      stored = []

      @store.each do |el|
        el.each do |subel|
          stored << subel
        end
        el = []
      end

      stored.each do |el|
        self[el] << el
      end
      # @store = Array.new(num_buckets) { Array.new }

  end
end
