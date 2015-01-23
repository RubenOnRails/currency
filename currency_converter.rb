class CurrencyConverter
  def initialize(hash)
    @hash = hash
  end

  def convert(currency, code)
    if currency.code == code
     return currency
    else
     total = currency.amount / @hash[currency.code] * @hash[code]
     return Currency.new(total, code)
    end
  end



end
