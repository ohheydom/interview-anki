require 'rails_helper'

feature 'Challenges Index' do
  scenario 'Redirects to sign in page if not logged in' do
    visit '/challenges'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
