=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

class Tournament

  def self.tally(input)
    results = {}
    self.tally_header
    parsed_inputs = self.parse_input(input)
    parsed_inputs.each do|parsed_match_input|
      self.compute_match_result(parsed_match_input, results)
    end
    results = self.sort_results(results)

    output = ''
    output += self.tally_header()
    
    results.each do |team_name, team_results|
      output += self.format_team_results(team_name, team_results)
    end

    debug output
    output
    
  end

  private
  
  def self.tally_header()
    "Team                           | MP |  W |  D |  L |  P\n"
  end

  def self.parse_input(input)
    lines = input.split("\n").filter{|string| string.length > 1}
    line_sections = lines.map{|line| line.split(';')}

    line_sections
  end

  def self.compute_match_result(parsed_match_input, results)
    team_1, team_2, outcome = parsed_match_input
    outcome = outcome.strip

    if !results[team_1]
      results[team_1] = {played: 0, won: 0, lost: 0, drawn: 0, points: 0}
    end
    if !results[team_2]
      results[team_2] ||= {played: 0, won: 0, lost: 0, drawn: 0, points: 0}
    end
      
    results[team_1][:played] += 1
    results[team_2][:played] += 1

    if outcome == 'win'
      results[team_1][:won] += 1
      results[team_2][:lost] += 1
      results[team_1][:points] += 3
    elsif outcome == 'loss'
      results[team_1][:lost] += 1
      results[team_2][:won] += 1
      results[team_2][:points] += 3
    elsif outcome == 'draw'
      results[team_1][:drawn] += 1
      results[team_2][:drawn] += 1
      results[team_1][:points] += 1
      results[team_2][:points] += 1
    end
  end

  def self.sort_results(results)
    results.sort_by{|team_name, team_results| [-team_results[:points], team_name]}.to_h
  end

  def self.format_team_results(team_name, team_results)
    "#{team_name.ljust(30)} | #{team_results[:played].to_s.rjust(2)} | #{team_results[:won].to_s.rjust(2)} | #{team_results[:drawn].to_s.rjust(2)} | #{team_results[:lost].to_s.rjust(2)} | #{team_results[:points].to_s.rjust(2)}\n"
  end
  
end