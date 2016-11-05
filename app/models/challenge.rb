class Challenge < ApplicationRecord
  attr_accessor :test_case_input, :test_case_output

  before_save :set_test_cases

  validates :slug, presence: true, uniqueness: true

  has_many :user_challenges, dependent: :destroy
  has_many :users, through: :user_challenges
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  serialize :test_cases, Array

  def language_string
    languages = { 3 => 'Java', 5 => 'Python', 8 => 'Ruby' }
    languages[self.language]
  end

  def set_test_cases
    self.test_cases = [@test_case_input, @test_case_output]
  end

  def test_case_input
    @test_case_input = self.test_cases[0]
  end

  def test_case_input=(value)
    @test_case_input = value
  end

  def test_case_output=(value)
    @test_case_output = value
  end

  def test_case_output
    @test_case_output = self.test_cases[1]
  end

  def starter_code_raw
    @starter_code_raw = self.starter_code == nil ? nil : self.starter_code.inspect[1..-2]
  end

  def boilerplate_code_raw
    @boilerplate_code_raw = self.boilerplate_code == nil ? nil : self.boilerplate_code.inspect[1..-2]
  end
end
