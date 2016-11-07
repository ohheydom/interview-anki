require 'date'
class UserChallenge < ApplicationRecord
  validates :user_id, uniqueness: {scope: :challenge_id}

  belongs_to :challenge
  belongs_to :user

  before_create :add_due_date

  scope :due_today, -> { where('due_date < ?', DateTime.tomorrow) }

  def due_today?
    self.due_date.to_date <= DateTime.now.to_date
  end

  def update_due_date(interval)
    self.update(reviews: self.reviews+1,
                due_date: DateTime.now + interval,
                last_reviewed: DateTime.now,
                interval: interval)
  end

  private
  def add_due_date
    self.due_date = DateTime.now
  end
end
