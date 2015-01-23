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
  

end
