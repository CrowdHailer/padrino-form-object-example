require_relative '../test_config'

class ExpenseFormTest < MiniTest::Test
  def test_can_have_a_description
    description = 'test item'
    form = ExpenseForm.new description: description
    assert_equal description, form[:description]
  end

end