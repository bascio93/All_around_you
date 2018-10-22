Then("I shouldn't see {string}") do |string|
  expect(page).to_not have_content(string)
end

Then("I should see {string} {string}") do |string, string2|
  expect(page).to have_content(string)
  expect(page).to have_content(string2)
end