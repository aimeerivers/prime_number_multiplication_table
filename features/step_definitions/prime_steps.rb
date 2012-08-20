Given /^a prime number multiplier$/ do
  @multiplier = PrimeNumberMultiplier.new
end

When /^I print the output$/ do
  @output = @multiplier.print_output!
end

Then /^I should see the following:$/ do |string|
  @output.should eql string
end
