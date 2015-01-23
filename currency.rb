class Currency
  attr_reader :amount, :code
  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(other)
   self.amount == other.amount && self.code == other.code
  end

  def +(other)
    if self.code == other.code
      total = self.amount + other.amount
      return Currency.new(total, @code)
    end
  end

  def -(other)
    if self.code == other.code
      total = self.amount - other.amount
      return Currency.new(total, @code)
    end
  end


end
