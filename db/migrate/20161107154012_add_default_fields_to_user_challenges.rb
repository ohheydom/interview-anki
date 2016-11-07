class AddDefaultFieldsToUserChallenges < ActiveRecord::Migration[5.0]
  def change
    change_column :user_challenges, :interval, :float, default: 0
    change_column :user_challenges, :reviews, :integer, default: 0
  end
end
