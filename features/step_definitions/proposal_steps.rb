When("I go create new book") do
	visit new_proposed_book_path
end

Given("a Proposal mid {int} did {int} lm {int} ld {int}") do |int, int2, int3, int4|
  Proposal.create!({:mittente_id => int, :destinatario_id => int2, :libromittente_id => int3, :librodestinatario_id => int4})
end

When("I visit my proposal") do
  visit proposals_path
end

Then("I should see a proposalcalled {string}") do |string|
  expect(page).to have_content(string)
end

Then("I shouldn't see a proposalcalled {string}") do |string|
  expect(page).to_not have_content(string)
end