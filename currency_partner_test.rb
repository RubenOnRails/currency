require 'minitest/autorun'
require 'minitest/pride'
require './currency'

class CurrencyTest < Minitest::Test
  def test_00_currency_class_exists
    assert Currency
  end

  def test_01_truth
    assert true
  end

  def test_02_currency_amount_and_code_exists
    assert Currency.new(100, "USD")
  end

  def test_03_currency_equal
    american_currency = Currency.new(100, "USD")
    other_currency = Currency.new(100, "USD")
    other2_currency = Currency.new(100, "CAN")
    assert american_currency == other_currency
    refute american_currency == other2_currency
  end

  def test_04_currency_can_be_added
    american_currency = Currency.new(100, "USD")
    other_currency = Currency.new(100, "USD")
    result = american_currency.+(other_currency)
    assert_equal 200, result.amount
  end



end
