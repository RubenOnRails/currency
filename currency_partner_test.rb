require 'minitest/autorun'
require 'minitest/pride'
require './currency'

class CurrencyTest < Minitest::Test
  def test_00_truth
    assert true
  end

  def test_01_currency_class_exists
    assert Currency
  end

  def test_02_currency_amount_and_code_exists
    assert Currency.new(100, "USD")
  end

end
