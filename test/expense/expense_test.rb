require_relative '../test_config'

class ExpenseTest < MiniTest::Test
  def test_can_save_money_amount
    amount = Money.new 500, 'gbp'
    Expense.create amount: amount
    assert_equal amount, Expense.last.amount
  end
end