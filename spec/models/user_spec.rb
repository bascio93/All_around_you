require 'spec_helper'

RSpec.describe User, :type => :model do

  it "Validazione utente" do
    user = User.new(:email => "utente@omega.it", :password => "123456", :password_confirmation => "123456", :username => "utente")
    expect(user).to be_valid
  end

  it "Creazione utente" do
    user = User.create(:email => "utente@omega.it", :password => "123456", :password_confirmation => "123456", :username => "utente")
    expect(User.first).to eq(user)
  end

  it "Verifica avatar default" do
    user = User.create(:email => "utente@omega.it", :password => "123456", :password_confirmation => "123456", :name => "utente")
    expect(User.first.avatar).not_to eq(nil)
  end

  it "Utente senza email" do
    user = User.new(:password => "passwordprova10*", :password_confirmation => "passwordprova10*", :username => "utente")
    expect(user).not_to be_valid
  end

  it "Utente senza username" do
    user = User.new(:email => "utente@omega.it", :password => "123456", :password_confirmation => "123456")
    expect(user).not_to be_valid
  end

  it "Utente senza password" do
    user = User.new(:email => "utente@omega.it", :password_confirmation => "123456", :username => "utente")
    expect(user).not_to be_valid
  end

  it "Assegnazione Servizio Utente" do
    user = User.create(:email => "utente@omega.it", :password => "123456", :password_confirmation => "123456", :username => "utente")
    property = user.properties.create!(:title => "Casa Grande", :description => "Casa veramente molto grande", :price => 5000, :city => "New York, Stati Uniti")
    expect(user.reload.properties.first).to eq(property)
  end
end
