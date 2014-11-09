require_relative '../test_config'

class ExpenseFormTest < MiniTest::Test
  def test_can_have_a_description
    description = 'test item'
    form = ExpenseForm.new description: description
    assert_equal description, form[:description]
  end

  def test_can_have_an_amount
    form = ExpenseForm.new fractional: 1000, currency: 'usd'
    assert_equal Money.new(1000, :usd), form[:amount]
  end

  def test_form_invalid_without_valid_currency
    form = ExpenseForm.new fractional: 100, currency: 'xkx'
    refute form.valid? 'Form should be invalid'
    assert form.errors.on(:amount)
  end

end