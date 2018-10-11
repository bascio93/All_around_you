class ApplicationController < ActionController::Base
    def show
    @user = User.find(params[:id])
    debugger
  end

  def new

  end
  def logged_in_users
    if !logged_in?
        salvalocation
        flash[:danger]="Errore, utente non loggato"
        redirect_to login_url
    end
  end
  protect_from_forgery with: :exception
  include SessionsHelper
end
