class CircularBuffer
  class BufferEmptyException < StandardError
    #def message
  end

  class BufferFullException < StandardError
  end

  def initialize(size)
    @buffer_size = size
    @buffer = []    
  end

  def write(item)    
    raise BufferFullException if buffer_full?
    return nil if item.nil?

    @buffer << item
  end

  def write!(item)
    return nil if item.nil?

    if buffer_full?
      @buffer.shift
      @buffer << item
    else
      write(item)
    end
  end

  def clear
    @buffer = []
  end

  def read
    raise BufferEmptyException if buffer_empty?
    @buffer.shift    
  end

  private

  def buffer_empty?
    @buffer.empty?
  end

  def buffer_full?
    @buffer.size >= @buffer_size
  end
end

