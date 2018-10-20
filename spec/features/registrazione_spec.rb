require 'spec_helper'

describe "Sign_in", type: :feature do
  scenario "as no logged user and valid field" do
    visit('http://allaroundyou.com:3000/')
    click_link('registrati')
    fill_in('name', with: 'Matteo')
    user_email='allr0undy0u@gmail.com'
    fill_in('email', with: user_email)
    fill_in('password', with: 'avalidpassword1421*')
    fill_in('password_confirmation', with: 'avalidpassword1421*')
    click_button 'Registrati'
    userr = User.find_by_email(user_email)
    expect(userr).to be_valid
    userr.should_not be_nil
    expect((User.find(userr.id)).to eq(userr)
    expect(User.first.activation_token).to eq(false)
    parse1=userr.mail.split("@").first
    parse2=userr.mail.split("@").second
    visit "http://allaroundyou.com:3000/account_activations/"+user.id+"/edit?activation_token="+user.activation_token+"&email="+parse1+"%40"+parse2
    expect(User.first.activation_token).to eq(true)
    expect(page).to have_current_path(user(userr)
    end
    scenario "as no logged user and no confermation " do
       visit('http://allaroundyou.com:3000/')
       click_link('registrati')
       fill_in('name', with: 'Matteo')
       user_email='allr0undy0u@gmail.com'
       fill_in('email', with: user_email)
       fill_in('password', with: 'avalidpassword1421*')
       click_button 'Registrati'
       expect(page).to have_current_path(signup_path)
       user=User.find_by(email: user_email)
       expect(user).to eq(nil)
    end
    scenario "as no logged user and no name " do
       visit('http://allaroundyou.com:3000/')
       click_link('registrati')
       user_email='allr0undy0u@gmail.com'
       fill_in('email', with: user_email)
       fill_in('password', with: 'avalidpassword1421*')
       click_button 'Registrati'
       expect(page).to have_current_path(signup_path)
       user=User.find_by(email: user_email)
       expect(user).to eq(nil)
    end
    scenario "as no logged user and no password " do
       visit('http://allaroundyou.com:3000/')
       click_link('registrati')
       fill_in('name', with: 'Matteo')
       user_email='allr0undy0u@gmail.com'
       fill_in('email', with: user_email)
       click_button 'Registrati'
       expect(page).to have_current_path(signup_path)
       user=User.find_by(email: user_email)
       expect(user).to eq(nil)
    end
end
