# make sure mongoid is loaded
if not defined?(Mongoid)
  require "mongoid"
end

require "mongoid/autofields"
