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

  def test_09_check_hash_of_conversion
    assert CurrencyConverter.new({USD: 1, EUR: 0.89})
  end

  def test_10_check_equal_conversion_code_and_object
    currency_converter = CurrencyConverter.new({USD: 1, EUR: 0.89})
    assert currency_converter.convert(Currency.new(1, :USD), :USD) == Currency.new(1, :USD)
  end

  def test_11_equal_requested_currency_code
    currency_converter = CurrencyConverter.new({USD: 1, EUR: 0.89})
    assert currency_converter.convert(Currency.new(1, :USD), :EUR) == Currency.new(0.89, :EUR)
  end

  def test_12_hash_with_three_currency_codes
    currency_converter = CurrencyConverter.new({USD: 1, EUR: 0.89, CAN: 1.24})
    assert_in_delta 1.24, currency_converter.convert(Currency.new(1, :USD), :CAN).amount, 0.05
    assert_in_delta 1.39, currency_converter.convert(Currency.new(1, :EUR), :CAN).amount, 0.05
  end

  def test_13_convert_currency_code_it_knows_about
    currency_converter = CurrencyConverter.new({USD: 1, EUR: 0.89, CAN: 1.24})
    assert_equal 0.89, currency_converter.convert(Currency.new(1, :USD), :EUR).amount
  end

# Should be able to convert Currency in any currency code it knows about to Currency in any other currency code it knows about.

end
