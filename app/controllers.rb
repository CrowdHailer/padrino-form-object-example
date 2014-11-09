Expenses::App.controllers  do
  
  get :index do
    ''
  end

  post :index do
    form = ExpenseForm.new params['expense']
    if form.valid?
      Expense.create form.to_hash
    end
    redirect '/'
  end

end
