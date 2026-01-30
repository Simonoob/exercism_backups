module SavingsAccount
  def self.interest_rate(balance)
    case
      when balance < 0
        3.213 #negative interest when * negative number
      when balance < 1000
        0.5
      when balance < 5000
        1.621
      else
        2.475
      end
  end

  def self.interest_amount(balance)
    balance * self.interest_rate(balance)/100
  end

  def self.annual_balance_update(balance)
    balance + self.interest_amount(balance)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    accumulated_amount = current_balance
    while accumulated_amount < desired_balance
      years+=1
      accumulated_amount += self.interest_amount(accumulated_amount)
    end
    years
  end
end
