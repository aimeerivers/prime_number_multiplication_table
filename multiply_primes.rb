$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')
require 'prime_number_multiplier'

puts PrimeNumberMultiplier.new.print_output!
