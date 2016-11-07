require 'anki'
require 'rails_helper'

def create_user_and_user_challenge
  @new_user = User.new(email: 'a@a.aaaaa', password: 'aaaaaa', username: 'aaaaaa')
  @new_user.save
  @new_challenge = @new_user.created_challenges.new({ slug: 'test-slug' })
  @new_challenge.save
  @user_challenge = @new_user.user_challenges.new(challenge_id: @new_challenge.id)
  @user_challenge.save
end

describe '.determine_next_dates' do
  before :each do
    create_user_and_user_challenge
  end

  it 'returns 10 minutes, 1 day, 2 days, and 3 days for a new challenge' do
    anki = Anki.new(@user_challenge)
    arr = anki.determine_next_dates
    expect(arr[0][0]).to eq('10 Minutes')
    expect(arr[3][0]).to eq('3 Days')
  end

  it 'returns 10 mins, interval, interval + 1, and interval + 2 days if < 3 reviews' do
    @user_challenge.update(reviews: 2, interval: 2)
    anki = Anki.new(@user_challenge)
    arr = anki.determine_next_dates
    expect(arr[3][0]).to eq('4 Days')
  end

  it 'returns 10 mins, interval, interval + 10, and interval + 20 days if > 3 reviews' do
    @user_challenge.update(reviews: 4, interval: 10)
    anki = Anki.new(@user_challenge)
    arr = anki.determine_next_dates
    expect(arr[3][0]).to eq('30 Days')
  end
end
