=begin
Write your code for the 'Diamond' exercise in this file. Make the tests in
`diamond_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/diamond` directory.
=end

module Diamond
  def self.make_diamond(input_letter)

    letters_to_target = [*'A'..input_letter]
    target_index = letters_to_target.length - 1

    shape_width = letters_to_target.length * 2 - 1
    
    top_half_lines = []

    letters_to_target.each_with_index do |letter, index|
      side_spaces = ' ' * (target_index - index)
      middle_spaces = index == 0 ? nil : ' ' * (index - 1)
      top_half_lines.push(format_string(side_spaces, letter, middle_spaces))
    end

    bottom_half_lines = top_half_lines.reverse.drop(1)
    result_lines = [*top_half_lines, *bottom_half_lines]
        
    result_string = "#{result_lines.join("\n")}\n"

    return result_string
  end

    def self.format_string(side_spaces, letter, middle_spaces=nil)
        middle_spaces == nil ? "#{side_spaces}#{letter}#{side_spaces}" : "#{side_spaces}#{letter}#{middle_spaces} #{middle_spaces}#{letter}#{side_spaces}"
    end
end