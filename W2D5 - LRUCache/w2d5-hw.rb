class LRUCache
    attr_reader :max_space, :array_cache
    def initialize(max_space)
      @max_space = max_space
      @array_cache = []
    end

    def count
      # returns number of elements currently in cache
      @array_cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @array_cache.full?
        @array_cache.shift
      elsif @array_cache.include?(el)
        @array_cache.shift
        @array_cache.push(el)
      else
        @array_cache.push(el)
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      @array_cache
    end
    private
    # helper methods go here!
    def full?
      self.count == self.max_space
    end

end
