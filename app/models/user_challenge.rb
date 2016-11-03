class UserChallenge < ApplicationRecord
  validates :user_id, uniqueness: {scope: :challenge_id}

  belongs_to :challenge
  belongs_to :user
end
