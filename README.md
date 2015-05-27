# Musicassette [![Build Status](https://img.shields.io/travis/odcinek/musicassette/master.svg)](https://travis-ci.org/odcinek/musicassette) [![Code Climate](https://img.shields.io/codeclimate/github/odcinek/musicassette.svg)](https://codeclimate.com/github/odcinek/musicassette) [![Gem Version](https://img.shields.io/gem/v/musicassette.svg)](https://rubygems.org/gems/musicassette)

A Ruby gem for handling SHOUTcast stream data

```ruby
require 'musicassette'

stream = Musicassette::Stream.new("http://mp3.polskieradio.pl:8904/;.mp3")
stream.chunk_size = 1024
stream.chunk_handler do |chunk|
  puts chunk.hash
end
stream.record!
```
