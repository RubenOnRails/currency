require 'minitest/autorun'
require 'minitest/pride'
require './currency'
require './different_currency_code_error'
require './currency_converter'

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

  def test_05_currency_can_be_subracted
    american_currency = Currency.new(101, "USD")
    other_currency = Currency.new(100, "USD")
    result = american_currency.-(other_currency)
    assert_equal 1, result.amount
  end

  def test_06_currency_error_when_adding_subtracting
    american_currency = Currency.new(100, "USD")
    other_currency = Currency.new(100, "CAN")
    assert_raises DifferentCurrencyCodeError do
      american_currency + other_currency && american_currency - other_currency
    end
  end

  def test_07_currency_multiplied_by_fixnum_and_float
    american_currency = Currency.new(100, "USD")
    assert american_currency * 2 == Currency.new(200, "USD")
    assert american_currency * 2.5 == Currency.new(250, "USD")
  end

  def test_08_currency_converter_class_exists
    assert CurrencyConverter
  end

  def test_09_check_hash_of_codes
    assert CurrencyConverter.new({USD: 1, EUR: 0.89})
  end

end
