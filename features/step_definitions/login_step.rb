include Registrazione
Given ("the login page and an already registered user {string} email {string} password {string}") do |string1, string2, string3|
    registrati(string1,string2,string3)
    visit esci_path
    visit login_path
end
When("i put email {string} and password {string}") do |string1, string2|
    expect(page).to have_current_path(login_path)
    fill_in('email', with: string1)
    fill_in('password', with: string2)
end
When("i click on login") do
    click_button('Log in')
end
Then("i should be on my site's page and my username {string} and my email {string} should appear") do |string, string2|
    expect(page).to have_content(string)
    expect(page).to have_content(string2)
end
