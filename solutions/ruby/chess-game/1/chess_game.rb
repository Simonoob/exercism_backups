module Chess
  RANKS = 1..8
  FILES = 'A'..'H'
  
  def self.valid_square?(rank, file)
    raise ArgumentError unless rank.is_a? Integer and file.is_a? String
    
    RANKS.include? rank and FILES.include? file
  end

  def self.nickname(first_name, last_name)
    raise ArgumentError unless [first_name, last_name].all? {|arg| arg.is_a? String}
    
    "#{first_name[0..1]}#{last_name[-2..-1]}".upcase
  end

  def self.move_message(first_name, last_name, square)
    raise ArgumentError unless [first_name, last_name, square].all? {|arg| arg.is_a? String}
    
    if valid_square?(square[1].to_i, square[0])
      "#{self.nickname(first_name, last_name)} moved to #{square}"
    else
      "#{self.nickname(first_name, last_name)} attempted to move to #{square}, but that is not a valid square"
    end
  end
end
