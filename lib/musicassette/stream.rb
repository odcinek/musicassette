class Musicassette::Stream
  def initialize uri

  end

  def chunk_handler &block
    if block
      @block = block
    else
      @block
    end
  end
end
