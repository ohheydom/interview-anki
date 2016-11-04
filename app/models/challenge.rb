class Challenge < ApplicationRecord
  validates :slug, presence: true, uniqueness: true

  has_many :user_challenges, dependent: :destroy
  has_many :users, through: :user_challenges

  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  def language_string
    languages = { 3 => 'Java', 5 => 'Python', 8 => 'Ruby' }
    languages[self.language]
  end
end
