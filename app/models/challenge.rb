class Challenge < ApplicationRecord
  validates :slug, presence: true, uniqueness: true
  has_many :user_challenges
  has_many :users, through: :user_challenges
end
