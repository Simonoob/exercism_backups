class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    unless ALLOWED_OPERATIONS.include? operation 
      raise UnsupportedOperation
    end
    
    unless first_operand.is_a? Integer and second_operand.is_a? Integer
      raise ArgumentError
    end

    begin
      result = eval("#{first_operand} #{operation} #{second_operand}")
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue ZeroDivisionError
      "Division by zero is not allowed."
    end
    
  end
end