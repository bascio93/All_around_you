When("I search for book {string}") do |string|
  fill_in "search_book", :with => string
  click_button "Cerca Libro"
end

Then("I should see {string} {string} {string}") do |string, string2, string3|
  expect(page).to have_content(string)
  expect(page).to have_content(string2)
  expect(page).to have_content(string3)
end

When("I visit homepage") do
  visit root_path
end

Then("I shouldn't see {string} {string}") do |string, string2|
  expect(page).to_not have_content(string)
  expect(page).to_not have_content(string2)
end
