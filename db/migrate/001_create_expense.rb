Sequel.migration do
  up do
    create_table(:expenses) do
      primary_key :id
      String :description
      Integer :fractional
      String :currency
    end
  end

  down do
  end
end
