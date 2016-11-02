require 'rails_helper'

feature 'Home Page' do
  scenario 'Page has the title Interview Anki' do
    visit '/'
    expect(page).to have_title('Interview Anki')
  end

  scenario 'Page has button to login' do
    visit '/'
    expect(page).to have_button('Login')
  end
end
