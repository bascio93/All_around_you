Given("i am on the registration page") do
  visit('http://allaroundyou.com:3000/')
end

When("i click on Registrati! Button") do
  click_link('registrati')
end

Then("i should be redirected to signup page") do
  visit signup_path
  expect(page).to have_current_path(signup_path)
end
