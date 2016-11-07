require 'rails_helper'

def login(new_user)
  visit '/'
  fill_in('user[email]', with: 'a@a.aaaaa')
  fill_in('user[password]', with: 'aaaaaa')
  click_button('Login')
end

feature 'Challenges Index' do
  before :each do
    @new_user = User.new(email: 'a@a.aaaaa', password: 'aaaaaa', username: 'aaaaaa')
    @new_user.save
    @new_challenge = @new_user.created_challenges.new({ slug: 'test-slug' })
    @new_challenge.save
  end

  scenario 'Redirects to sign in page if not logged in' do
    visit '/challenges'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'Asks the user to add the challenge to his/her list if the challenge is not part of the user\'s list' do
    login(@new_user)
    visit challenge_path(@new_challenge)
    expect(page).to have_content('You must save this challenge to your list if you wish to practice the challenge.')
  end

  scenario 'Does not ask the user to add the challenge to his/her list if the challenge is part of the user\'s list' do
    @new_user.user_challenges.new(challenge_id: @new_challenge.id).save
    login(@new_user)
    visit challenge_path(@new_challenge)
    expect(page).to_not have_content('You must save this challenge to your list if you wish to practice the challenge.')
  end

  scenario 'Returns a message if the challenge is not due today' do
    user_challenge = @new_user.user_challenges.new(challenge_id: @new_challenge.id)
    user_challenge.save
    user_challenge.update(due_date: DateTime.now + 1)
    login(@new_user)
    visit challenge_path(@new_challenge)
    expect(page).to have_content('This challenge is not due today.')
  end
end

feature 'New Challenge' do
  before :each do
    @new_user = User.new(email: 'a@a.aaaaa', password: 'aaaaaa', username: 'aaaaaa')
    @new_user.save
    @new_challenge = @new_user.created_challenges.new({ slug: 'test-slug' })
    @new_challenge.save
  end

  scenario 'Redirects to sign in page if not logged in' do
    visit new_challenge_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'Create new challenge has a button to Add more test cases' do
    login(@new_user)
    visit new_challenge_path
    expect(page).to have_link('Add a test case')
  end
end
