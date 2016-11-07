class AddFieldsToUserChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :user_challenges, :interval, :integer
    add_column :user_challenges, :reviews, :integer
    add_column :user_challenges, :last_reviewed, :datetime
    add_column :user_challenges, :due_date, :datetime
  end
end
