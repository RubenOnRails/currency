class Currency
  attr_accessor :amount, :code
  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(other)
   self.amount == other.amount && self.code == other.code
  end




end
