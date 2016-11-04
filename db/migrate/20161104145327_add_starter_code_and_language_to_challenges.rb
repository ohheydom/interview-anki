class AddStarterCodeAndLanguageToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :starter_code, :string
    add_column :challenges, :language, :integer
  end
end
