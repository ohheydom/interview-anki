class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_challenges, dependent: :destroy
  has_many :challenges, through: :user_challenges, dependent: :destroy

  has_many :created_challenges, class_name: 'Challenge', foreign_key: :creator_id, dependent: :destroy
end
