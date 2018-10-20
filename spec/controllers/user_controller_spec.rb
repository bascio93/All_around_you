require "rails_helper"

RSpec.describe UserController, :type => :controller do
  login_user

  it "should have a current_user" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_user).to_not eq(nil)
  end

  it "should have a username" do
    expect(subject.current_user.username).to eq("GianniBiondi")
  end

  describe "GET new" do
    it "gives a response status 200" do
      get :index
      expect(response.status).to eq(200)
    end

    it "shows an html page" do
      get :index
      expect(response.content_type).to eq "text/html"
    end

    it "renders the home page" do
      get :index
      expect(response).to render_template(:index)#mettere nome pagina html al posto di index
    end
  end

  describe "GET preferiti" do
    it "gives a response status 200" do
      get :preferiti
      expect(response.status).to eq(200)
    end

    it "shows an html page" do
      get :preferiti
      expect(response.content_type).to eq "text/html"
    end

    it "renders the results page" do
      get :results
      expect(response).to render_template(:results)
    end
  end


end
