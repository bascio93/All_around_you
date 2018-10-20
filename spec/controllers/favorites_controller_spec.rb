require "rails_helper"

RSpec.describe PropertiesController, :type => :controller do
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET index" do
    it "renders the favorites list" do
      get :aggiungi
      expect(response).to render_template(:aggiungi)
    end
  end

  describe "Create a new insertion" do
    it "renders the new page" do
      get :create
      expect(response).to render_template(:create)
    end

    it "creates the favorite" do
      post :create, params: {property: {title: "Casa bella grande",
      description: "È una casa molto spaziosa",
      user_id: "1",
      city: "Rome, Italy",
      price: "125",
      categories: [""],
      }}
      expect(response).to redirect_to('/properties/1')
    end
  end
end
