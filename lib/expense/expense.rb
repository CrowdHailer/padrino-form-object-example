class Expense < Sequel::Model(:expenses)
  def amount
    Money.new(fractional, currency)
  end

  def amount=(amount)
    self.fractional = amount.fractional
    self.currency = amount.currency
  end
end