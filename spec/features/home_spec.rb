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
