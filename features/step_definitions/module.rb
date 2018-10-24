module Registrazione
require_relative '../support/env'

def registrati(nome, email, password)
    visit signup_path
    fill_in('name',:with => nome)
    fill_in('email', :with =>email)
    fill_in('password',:with => password)
    fill_in('password_confirmation', :with =>password)
    click_button 'registrati'
    userr = User.find_by_email(email)
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
def loggati(email, password)
    visit login_path
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button('Log in')
end
end
