When("I search for user {string}") do |string|
  fill_in "search_user", :with => string
  click_button "Cerca Utente"
end

Then("I shouldn't see {string} {string} {string}") do |string, string2, string3|
  expect(page).to_not have_content(string)
  expect(page).to_not have_content(string2)
  expect(page).to_not have_content(string3)
end