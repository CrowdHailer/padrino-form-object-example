class ExpenseForm
  include Virtus.model
  include Veto.model(Validator.new)

  attribute :description, String
  attribute :fractional, Integer, :reader => :private 
  attribute :currency, String, :reader => :private 
  attribute :amount

  def amount
    begin
      Money.new fractional, currency
    rescue Money::Currency::UnknownCurrency
      nil
    end
  end
end