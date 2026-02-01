=begin
Write your code for the 'Rna Transcription' exercise in this file. Make the tests in
`rna_transcription_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rna-transcription` directory.
=end

module Complement
  def self.of_dna(input)
    dna_to_rna = {
      'G': 'C',
      'C': 'G',
      'T': 'A',
      'A': 'U',
    }
    
    input.chars.map { |char| dna_to_rna[char.to_sym] }.join('')
  end
end