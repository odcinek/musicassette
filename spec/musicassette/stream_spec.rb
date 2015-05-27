require 'spec_helper'

describe Musicassette::Stream do
  it 'initializes a stream' do
    Musicassette::Stream.new('https://foo:9000')
  end

  it 'registers a handler' do
    stream = Musicassette::Stream.new('https://foo:9000')
    stream.chunk_handler.should eq(nil)
    stream.chunk_handler do |chunk|
      puts 'foo'
    end
    stream.chunk_handler.should_not eq(nil)
  end
end
