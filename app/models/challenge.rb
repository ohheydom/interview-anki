class Challenge < ApplicationRecord
  validates :slug, presence: true, uniqueness: true

  has_many :user_challenges, dependent: :destroy
  has_many :users, through: :user_challenges
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  serialize :test_case_input, Array
  serialize :test_case_output, Array

  def test_cases
    self.test_case_input.zip(self.test_case_output)
  end

  def language_string
    languages = { 3 => 'Java', 5 => 'Python', 8 => 'Ruby' }
    languages[self.language]
  end

  def starter_code_raw
    @starter_code_raw = self.starter_code == nil ? nil : self.starter_code.inspect[1..-2]
  end

  def boilerplate_code_raw
    @boilerplate_code_raw = self.boilerplate_code == nil ? nil : self.boilerplate_code.inspect[1..-2]
  end
end
