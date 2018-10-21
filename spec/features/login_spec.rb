
require_relative '../rails_helper'
describe "Log_in :", type: :feature do
  scenario "as no logged user" do
    visit('http://allaroundyou.com:3000/')
    userr=User.create(:name => "Giggetto o paninaro", :email => "g1gg10@omega.it", :password => "paninigratis1234*")
    catch1=userr.email.split("@").first
    catch2=userr.email.split("@").second
    visit "http://allaroundyou.com:3000/account_activations/"+userr.id.to_s+"/edit?activation_token="+userr.activation_token+"&email="+catch1+"%40"+catch2
    userrr=User.find(userr.id)
    expect(userrr.activated).to eq(true)
    expect(page).to have_current_path(user_path(userr))
    visit esci_path
    visit login_path
    fill_in('email', with: "g1gg10@omega.it")
    fill_in('password', with: "paninigratis1234*")
    click_button('Log in')
    expect(page).to have_current_path(user_path(userr))
    end
end
