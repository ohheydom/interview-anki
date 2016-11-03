require 'rails_helper'

feature 'Home Page Not Logged in' do
  scenario 'Page has the title Interview Anki' do
    visit '/'
    expect(page).to have_title('Interview Anki')
  end

  scenario 'Page has button to login' do
    visit '/'
    expect(page).to have_button('Login')
  end

  scenario 'Page has link to Signup' do
    visit '/'
    expect(page).to have_link('Signup')
  end
end

feature 'Home Page Logged in' do
  scenario 'Page has link to create new challenge' do
    new_user = User.new(email: 'a@a.aaaaa', password: 'aaaaaa', username: 'aaaaaa').save
    visit '/'
    fill_in('user[email]', with: 'a@a.aaaaa')
    fill_in('user[password]', with: 'aaaaaa')
    click_button('Login')
    expect(page).to have_link('Create a new challenge')
  end

  scenario 'Page has link to view all created challenges' do
    new_user = User.new(email: 'a@a.aaaaa', password: 'aaaaaa', username: 'aaaaaa').save
    visit '/'
    fill_in('user[email]', with: 'a@a.aaaaa')
    fill_in('user[password]', with: 'aaaaaa')
    click_button('Login')
    expect(page).to have_link('View Created Challenges')
  end
end
