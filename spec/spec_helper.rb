require 'target'

require 'simplecov'
SimpleCov.start do
  minimum_coverage 95
  add_filter ".gems/"
  add_filter "spec/"
end