require 'prime'

class PrimeNumberMultiplier

  attr_reader :top_row, :left_column, :output

  def initialize(x=10, y=10)
    @top_row = Prime.take x
    @left_column = Prime.take y
    @output = @left_column.reduce([]) {|output, multiplier|
      output << @top_row.map {|value| multiplier * value }
    }
  end

  def left_column_width
    @left_column.max.to_s.length
  end

  def column_widths
    @output.transpose.map {|column| column.max.to_s.length }
  end

  def print_contents! contents
    string = ''
    contents.each_with_index {|value, index|
      string += value.to_s.rjust(column_widths[index] + 1)
    }
    string
  end

  def print_top_row!
    ''.rjust(left_column_width) + " |" + print_contents!(@top_row)
  end

  def print_divider_row!
    print_top_row!.gsub(/./, '-')
  end

  def print_row!(row_number)
    @left_column[row_number].to_s.rjust(left_column_width) +
      " |" +
      print_contents!(@output[row_number])
  end

  def print_output!
    lines = [print_top_row!, print_divider_row!]
    @left_column.each_with_index {|multiplier, row|
      lines << print_row!(row)
    }
    lines.join("\n")
  end

end
