require 'spec_helper'

describe "Login", type: :feature do
  scenario "as no logged user" do
    visit('http://allaroundyou.com:3000/')
    click_link('loggati')
    userr=User.create(:name => "Matteo", :email => "allr0undy0u@gmail.com", :password => "avalidpassword1234*")
    parse1=userr.mail.split("@").first
    parse2=userr.mail.split("@").second
    visit "http://allaroundyou.com:3000/account_activations/"+userr.id+"/edit?activation_token="+userr.activation_token+"&email="+parse1+"%40"+parse2
    log_out
    visit login_path
    fill_in('email', userr.email)
    fill_in('password', "avalidpassword1234*")
    expect(page).to have_current_path(user(userr))
    end
end
