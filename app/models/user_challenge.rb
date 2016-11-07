require 'date'
class UserChallenge < ApplicationRecord
  validates :user_id, uniqueness: {scope: :challenge_id}

  belongs_to :challenge
  belongs_to :user

  before_create :add_due_date

  scope :due_today, -> { where('due_date <= ?', DateTime.now) }

  def due_today?
    self.due_date <= DateTime.now
  end

  private
  def add_due_date
    self.due_date = Date.today
  end
end
