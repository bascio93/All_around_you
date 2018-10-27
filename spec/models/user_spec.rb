require_relative '../rails_helper'

RSpec.describe User, :type => :model do

  it "Validazione utente" do
    user = User.new(:email => "utente4@prova.it", :name => "Matteob", :password => "avalidpassword1234*")
    expect(user).to be_valid
  end
  it "Utente senza nome" do
    user = User.new(:password => "123456", :email => "utente4@prova.it" )
    expect(user).not_to be_valid
  end
  it "Utente senza email" do
    user = User.new(:name => "utente4", :password => "avalidpassword1234*" )
    expect(user).not_to be_valid
  end
end
