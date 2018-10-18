# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
     def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
       @user = User.from_omniauth(request.env['omniauth.auth'])
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        log_in(@user)
        redirect_to @user
   end
end
