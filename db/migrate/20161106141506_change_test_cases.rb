class ChangeTestCases < ActiveRecord::Migration[5.0]
  def change
    remove_column :challenges, :test_cases
    add_column :challenges, :test_case_input, :string
    add_column :challenges, :test_case_output, :string
  end
end
