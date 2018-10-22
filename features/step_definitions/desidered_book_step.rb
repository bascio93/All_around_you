Given("a DesideredBook exists called {string} with isbn {string} from user with {int} as id") do |string, isbn, id|
  DesideredBook.create({:nome => string, :user_id => id, :ISBN => isbn})
end

When("I visit my desidered book list") do
  visit desidered_books_path
end