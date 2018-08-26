class Stack #LIFO
  def initialize
    @stack = []
  end

  def push(el)
    @stack << el
    el
  end

  def pop
    el = @stack.last
    @stack = @stack[0...-1]
    el
  end

  def peek
    @stack.last
  end

end

class Queue #FIFO

  def initialize
    @my_que = []
  end

  def enqueue(el)
    @my_que << el
  end

  def dequeue
    @my_que.shift
  end

  def peek
    @my_que.first
  end

end

class Map

  def initialize
    @array = []
  end

  def set(key, value)
    @array.each_index do |idx|
      if @array[idx][0] == key
        @array[idx][1] = value
      else
        @array.push([key, value])
      end
    end
    @array
  end

  def get(key)
    @array.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def delete(key)
    value = get(key)
    @array.reject! do |pair|
      pair[0] == key
    end
    value
  end

  def show
    @array
  end


end
