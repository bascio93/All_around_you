Given("a ProposedBook exists called {string} with isbn {string} from user with {int} as id") do |string, isbn, id|
  ProposedBook.create({:nome => string, :user_id => id, :ISBN => isbn})
end 

When /^I visit my proposed book list$/ do
  visit proposed_books_path
end

When("I go create new book") do
	visit new_proposed_book_path
end

Then /^I should see a ProposeBook called "(.+)"$/ do |title|
  page.should have_content title
end

Given("a valid user with email {string} username {string} and password {string}") do |string, string1, string2|
  User.create!({:email => string, :username => string1, :password => string2, :password_confirmation => string2 })
end

When("I go to the login page") do
  visit  new_user_session_path
end

When("I sign in with email {string} and password {string}") do |string, string2|
  fill_in "user_email", :with => string
  fill_in "user_password", :with => string2
  click_button "Log in"
end

Then("I should see {string}") do |string|
  expect(page).to have_content(string)
end

Then("I shouldn't see a ProposeBook called {string}") do |string|
  expect(page).to_not have_content(string)
end