Given("a valid exchange with mid {int} did {int} libromittente {string} librodestinatario {string}") do |int, int2, string, string2|
  Exchange.create(:mittente_id => int, :destinatario_id => int2, :libromittente => string, :librodestinatario => string2)
end

Then("I should see a exchange involving {string} {string} and {string}") do |string, string2, string3|
  expect(page).to have_content(string)
  expect(page).to have_content(string2)
  expect(page).to have_content(string3)
end

Then("I shouldn't see a exchange involving {string}") do |string|
  expect(page).to_not have_content(string)
end