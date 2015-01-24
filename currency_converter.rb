class CurrencyConverter
  def initialize(hash)
    @hash = hash
  end

  def convert(currency, code)
    if currency.code == code
     return currency
    end
    if total = currency.amount / @hash[currency.code] * @hash[code]
     return Currency.new(total, code)
    else
     raise UnknownCurrencyCodeError
    end
  end
end

class UnknownCurrencyCodeError < StandardError

end
