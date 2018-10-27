module ControllerMacros
  #def login_admin
    #before(:each) do
      #sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    #end
  #end

  def login_user
      user = FactoryGirl.create(:user)
      user.activated=true
    end
  end
end
