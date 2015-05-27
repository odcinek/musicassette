require 'spec_helper'

STREAM_URL = 'https://foo:9000'

describe Musicassette::Stream do

  let(:stream) { Musicassette::Stream.new(STREAM_URL) }

  it 'registers a handler' do
    stream.chunk_handler.should eq(nil)
    stream.chunk_handler do |chunk|
      puts 'foo'
    end
    stream.chunk_handler.should_not eq(nil)
  end

  it 'sets a chunk size' do
    stream.chunk_size.should eq(1024)
    stream.chunk_size = 2048
    stream.chunk_size.should eq(2048)
  end

  it 'should start recording' do
    sample = File.read('spec/fixtures/sample01.bin')
    response = Typhoeus::Response.new(:code => 200, :body => sample)
    Typhoeus.stub(STREAM_URL).and_return(response)

    stream.chunk_handler do |chunk|
      puts 'foo'
    end
    stream.record!
  end
end
