require 'typhoeus'

class Musicassette::Stream

  attr_writer :chunk_size

  def initialize uri
    @uri = uri
    @request = Typhoeus::Request.new(@uri)
  end

  def chunk_handler &block
    if block
      @block = block
      @request.on_body do |chunk|
        #puts chunk.size
      end
    else
      @block
    end
  end

  def chunk_size
    @chunk_size || 1024
  end

  def record!
    @request.run
  end
end
