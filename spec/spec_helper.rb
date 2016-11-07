require "simplecov"
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "djvu"

RSpec.configure do |config|
  def fixture(filename)
    # puts "#{filename}: read action"
    File.expand_path("spec/fixtures/#{filename}")
  end
end
