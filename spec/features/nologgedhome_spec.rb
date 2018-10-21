
require_relative '../rails_helper'
describe "Visit Homepage", type: :feature do
  scenario "as no logged user" do
    visit('http://allaroundyou.com:3000/')
    expect(page).to have_content("Loggati!")
    expect(page).to have_content("Registrati!")
    expect(page).to have_content("Sign in with Google")
    end
end
