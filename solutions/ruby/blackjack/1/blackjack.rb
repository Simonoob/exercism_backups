module Blackjack

  CARD_TO_VALUE = {
    ace: 11,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
    ten: 10,
    jack: 10,
    queen: 10,
    king: 10,
  }
  
  def self.parse_card(card)
    raise ArgumentError unless card.is_a? String
    
    CARD_TO_VALUE[card.to_sym] or 0
  end

  def self.card_range(card1, card2)
    raise ArgumentError unless [card1,card2].all? String
    
    case self.parse_card(card1) + self.parse_card(card2)
      when 4..11 then 'low'
      when 12..16 then 'mid'
      when 17..20 then 'high'
      when 21 then 'blackjack'
    else 'invalid cards combination'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    score_range = self.card_range(card1, card2)
    
    case
      when [card1, card2].all? {|card| card=='ace'} then 'P' #split
      when score_range == 'blackjack'
        if [10,11].include? self.parse_card(dealer_card)
          'S'
        else
          'W'
        end
      when score_range == 'high' then 'S'
      when score_range == 'mid'
        if self.parse_card(dealer_card) >= 7
          'H'
        else
          'S'
        end
      when score_range == 'low' then 'H'
    else
      raise 'unknown case'
    end
    
  end
end
