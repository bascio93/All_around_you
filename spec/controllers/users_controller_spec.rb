require_relative '../rails_helper'
include ControllerMacros
RSpec.describe UsersController, :type => :controller do
  describe "GET index" do
    login_user
    it "renderizza tutti gli utenti" do
      get :index
      expect(response).to redirect_to('/users')
    end
  end
  describe "POST create" do
    login_user
    it "crea un nuovo utente" do
      post :create, params: {user: {name: "Utentediprova12",
      email: "Prova12@live.it",
      password: "avalidpassword1234*"
       }
       }
      expect(response).to redirect_to('/')
    end
  end
  describe "GET show" do
    login_user
    it "renderizza l'utente corrente" do
      get :show, params: {id: 1}
      expect(response).to redirect_to('servizi/1')
      expect(response).to render_template(:show)
    end
  end
end
