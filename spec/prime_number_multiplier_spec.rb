require 'prime_number_multiplier'

describe 'PrimeNumberMultiplier' do

  let(:multiplier) { PrimeNumberMultiplier.new }

  it 'has prime numbers across the top' do
    multiplier.top_row.should == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end

  it 'has prime numbers in the left column' do
    multiplier.left_column.should == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end

  it 'already knows the output' do
    multiplier.output.should == [
      [4, 6, 10, 14, 22, 26, 34, 38, 46, 58],
      [6, 9, 15, 21, 33, 39, 51, 57, 69, 87],
      [10, 15, 25, 35, 55, 65, 85, 95, 115, 145],
      [14, 21, 35, 49, 77, 91, 119, 133, 161, 203],
      [22, 33, 55, 77, 121, 143, 187, 209, 253, 319],
      [26, 39, 65, 91, 143, 169, 221, 247, 299, 377],
      [34, 51, 85, 119, 187, 221, 289, 323, 391, 493],
      [38, 57, 95, 133, 209, 247, 323, 361, 437, 551],
      [46, 69, 115, 161, 253, 299, 391, 437, 529, 667],
      [58, 87, 145, 203, 319, 377, 493, 551, 667, 841]
    ]
  end

  it 'calculates the column widths' do
    multiplier.column_widths.should == [2, 2, 3, 3, 3, 3, 3, 3, 3, 3]
  end

  it 'calculates the left column width' do
    multiplier.left_column_width.should == 2
  end

  describe 'printing' do

    it 'can print the top row' do
      multiplier.print_top_row!.should == "   |  2  3   5   7  11  13  17  19  23  29"
    end

    it 'can print a divider row of the correct length' do
      multiplier.print_divider_row!.should == "------------------------------------------"
    end

    it 'can print a row given a multiplier and contents' do
      multiplier.print_row!(0)
        .should == " 2 |  4  6  10  14  22  26  34  38  46  58"
    end

    it 'can correctly justify the number on the left' do
      multiplier.print_row!(9)
        .should == "29 | 58 87 145 203 319 377 493 551 667 841"
    end

  end

  context 'initializing with a different number for the axes' do

    it 'can change the top row' do
      PrimeNumberMultiplier.new(5).top_row.size.should == 5
    end

    it 'can change the left column' do
      PrimeNumberMultiplier.new(10, 6).left_column.size.should == 6
    end

    it 'multiplies the output' do
      PrimeNumberMultiplier.new(3, 3).output.should == [
        [4, 6, 10],
        [6, 9, 15],
        [10, 15, 25]
      ]
    end

    it 'does not have to be a square' do
      PrimeNumberMultiplier.new(4, 2).output.should == [
        [4, 6, 10, 14],
        [6, 9, 15, 21]
      ]
    end

  end

end
