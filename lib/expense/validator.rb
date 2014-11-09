class ExpenseForm
  class Validator
    include Veto.validator

    validates :amount, presence: true
  end
end