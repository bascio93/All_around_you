require_relative '../rails_helper'

RSpec.describe Servizi, :type => :model do
    describe "Creazione servizio valido " do
      it "Dovrebbe creare il servizio e dovrebbe essere valido" do
        u=User.create(:name => "Ciao", :email => "mailprova@prova.it", :password => "avalidpassword1234*")
        s=Servizi.new(:nome => "Bar prova", :tipo => "Bar", :indirizzo => "Via Nomentana", :descrizione => "provaaa")
        s.user=u
        expect(s).to be_valid
      end
     end
    describe "Creazione servizio valido " do
      it "Dovrebbe creare il servizio e dovrebbe essere valido" do
        u=User.create(:name => "Ciao", :email => "mailprova@prova.it", :password => "avalidpassword1234*")
        s=Servizi.new(:nome => "Bar prova", :tipo => "Bar", :indirizzo => "Via Nomentana", :descrizione => "provaaa")
        s.user=u
        expect(s).to be_valid
      end
    end
    describe "Creazione servizio senza utente " do
      it "Dovrebbe non essere valido" do
        s=Servizi.new(:nome => "Bar prova", :tipo => "Bar", :indirizzo => "Via Nomentana", :descrizione => "provaaa")
        expect(s).not_to be_valid
      end
    end
end
