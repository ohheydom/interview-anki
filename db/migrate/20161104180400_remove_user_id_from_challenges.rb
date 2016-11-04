class RemoveUserIdFromChallenges < ActiveRecord::Migration[5.0]
  def change
    remove_column :challenges, :user_id
    add_index :challenges, :creator_id
  end
end
