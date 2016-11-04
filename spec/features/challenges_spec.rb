require 'rails_helper'

feature 'Challenges Index' do
  scenario 'Redirects to sign in page if not logged in' do
    visit '/challenges'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'Asks the user to add the challenge to his/her list if the challenge is not part of the user\'s list' do
    new_user = User.new(email: 'a@a.aaaaa', password: 'aaaaaa', username: 'aaaaaa')
    new_user.save
    new_challenge = new_user.created_challenges.new({ slug: 'test-slug' })
    new_challenge.save
    visit '/'
    fill_in('user[email]', with: 'a@a.aaaaa')
    fill_in('user[password]', with: 'aaaaaa')
    click_button('Login')
    visit challenge_path(new_challenge)
    expect(page).to have_content('You must save this challenge to your list if you wish to practice the challenge.')
  end

  scenario 'Does not ask the user to add the challenge to his/her list if the challenge is part of the user\'s list' do
    new_user = User.new(email: 'a@a.aaaaa', password: 'aaaaaa', username: 'aaaaaa')
    new_user.save
    new_challenge = new_user.created_challenges.new({ slug: 'test-slug' })
    new_challenge.save
    new_user.user_challenges.new(challenge_id: new_challenge.id).save
    visit '/'
    fill_in('user[email]', with: 'a@a.aaaaa')
    fill_in('user[password]', with: 'aaaaaa')
    click_button('Login')
    visit challenge_path(new_challenge)
    expect(page).to_not have_content('You must save this challenge to your list if you wish to practice the challenge.')
  end
end
