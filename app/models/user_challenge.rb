class UserChallenge < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
  validates :user_id, uniqueness: {scope: :challenge_id}
end
