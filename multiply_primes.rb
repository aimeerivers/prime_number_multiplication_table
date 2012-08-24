$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')
require 'prime_number_multiplier'

x = ARGV[0] || 10
y = ARGV[1] || 10
puts PrimeNumberMultiplier.new(x, y).print_output!
