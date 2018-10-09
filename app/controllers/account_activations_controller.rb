class AccountActivationsController < ApplicationController
    def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && params[:activation_token]===user.activation_token
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to signup_url
    end
  end
end
