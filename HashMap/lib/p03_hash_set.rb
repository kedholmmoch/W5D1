class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    self[key] << key

    @count += 1
    resize! if count >= @store.length
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
    #@store[num % @store.length]
    @store[num.hash % @store.length]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store.length.times { @store << [] }

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
  end
end
