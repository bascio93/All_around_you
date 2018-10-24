Given("i am on the signup page") do
  visit signup_path
end
When("i put value on fields with email {string} username {string} and password {string}") do |string, string2, string3|
    fill_in('name',:with => string2)
    fill_in('email', :with =>string)
    fill_in('password',:with => string3)
    fill_in('password_confirmation', :with =>string3)
end

When("i click on Registrati button and then on the activation link sent at email {string}") do |string|
  click_button 'registrati'
    userr = User.find_by_email(string)
    expect(userr).to be_valid
    userr.should_not be_nil
    expect(User.find(userr.id)).to eq(userr)
    expect(userr.activated).to eq(false)
    parse1=userr.email.split("@").first
    parse2=userr.email.split("@").second
    visit "http://allaroundyou.com:3000/account_activations/"+userr.id.to_s+"/edit?activation_token="+userr.activation_token+"&email="+parse1+"%40"+parse2
    userrr=User.find(userr.id)
    expect(userrr.activated).to eq(true)
end

Then("i should be redirected to my profile with email {string} username {string}") do |string, string2|
    userr=User.find_by_email(string)
    expect(userr).to be_valid
    expect(userr.email.to_s).to eq(string.to_s)
    expect(userr.name.to_s).to eq(string2)
    expect(page).to have_current_path(user_path(userr))
    expect(page).to have_content(string)
    expect(page).to have_content(string2)
end

