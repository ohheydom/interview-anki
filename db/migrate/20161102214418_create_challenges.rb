class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :slug
      t.string :test_cases
      t.string :description
      t.string :boilerplate_code

      t.timestamps
    end
  end
end
