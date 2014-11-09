class ExpenseForm
  include Virtus.model

  attribute :description, String
  attribute :fractional, Integer, :reader => :private 
  attribute :currency, String, :reader => :private 
  attribute :amount

  def amount
    Money.new fractional, currency
  end
end