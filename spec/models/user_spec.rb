require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Is not valid without a username' do
    new_user = User.new(email: 'a@a.a', password: 'aaaaaa')
    expect(new_user).to_not be_valid
  end

  it 'Is not valid without a unique username' do
    new_user = User.new(email: 'a@a.a', password: 'aaaaaa', username: 'aaaaaa')
    new_user.save
    new_user_2 = User.new(email: 'a2@a2.a', password: 'aaaaaa', username: 'aaaaaa')
    expect(new_user_2).to_not be_valid
  end
end
