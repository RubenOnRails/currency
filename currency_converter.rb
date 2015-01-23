class CurrencyConverter
  def initialize(hash)
    @hash = hash
  end

  def convert(currency, code)
    if currency.code == code
     return currency
    end
  end

end
