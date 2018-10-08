class PasswordResetsController < ApplicationController
    before_action :get_user,   only: [:edit, :update]
    before_action :valid_user, only: [:edit, :update]
    before_action :passwscaduta, only: [:edit, :update]
    def new
    end
    def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end
  def get_user
      @user = User.find_by(email: params[:email])
  end
  def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end
  def passvuota?
      return params[:user][:password].blank?
  end
  def user_params
      params.require(:user).permit(:password, :password_confirmation)
  end
  def update
    if passvuota?
      flash.now[:danger] = " La password non può essere vuota"
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password resettata"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def passwscaduta
    if @user.paswscaduta?
        flash[:danger] = "Link scaduto"
        redirect_to new_password_reset_url
      end
  end
end
