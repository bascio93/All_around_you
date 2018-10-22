Given("a valid review with rating {int} and comment {string} to user with id {int}") do |int1, string, int2|
  UserReview.create(:rating => int1, :comment => string, :user_id => int2)
end

When("I visit {int} profile") do |int|
	visit '/users/' + int.to_s
end

Then("I should see a review with {int} and {string}") do |int, string|
  expect(page).to have_content(int)
  expect(page).to have_content(string)
end

Then("I shouldn't see a review with {int} and {string}") do |int, string|
  expect(page).to_not have_content(string)
  expect(page).to have_content(int)
end