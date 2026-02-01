module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    raise ArgumentError unless city.is_a? String
    city[0,4].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    cargo = ship_identifier.to_s.downcase[0,3]
    if ['oil', 'gas'].include? cargo
      :A
    else
      :B
    end
  end
end
