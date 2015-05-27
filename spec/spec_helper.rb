$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'musicassette'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.before :each do
    Typhoeus::Expectation.clear
  end
end
