require_relative '../test_config'

class ControllersTest < MiniTest::Test
  def setup
    app Expenses::App do
      set :protect_from_csrf, false
    end
  end

  def test_create_method_adds_expense_to_database
    assert Expense.empty?
    post '/', expense: {
      'description' => 'First expense',
      'fractional' => '1250',
      'currency' => 'nok'
    }
    expense = Expense.last
    assert_equal 'First expense', expense.description
    assert_equal Money.new(1250, 'nok'), expense.amount
  end

  def test_adding_expense_return_status_ok
    post '/', expense: {
      'description' => 'First expense',
      'fractional' => '1250',
      'currency' => 'nok'
    }
    follow_redirect!
    assert last_response.ok?, 'creating expense should be ok'
  end

  def test_invalid_form_does_not_create_expense
    post '/', expense: {
      'description' => 'First expense',
      'fractional' => '',
      'currency' => ''
    }
    follow_redirect!
    assert last_response.ok?, 'creating expense should be ok'
    assert Expense.empty?
  end
end