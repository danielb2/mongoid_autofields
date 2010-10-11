require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
gem 'bson', '1.0.4'
gem "mongoid"
require 'mongoid_autofields'

Mongoid.configure do |config|
  name = "test"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
end

class Test::Unit::TestCase
end
