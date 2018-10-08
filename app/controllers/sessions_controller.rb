class SessionsController < ApplicationController
  def new
  end
  def create
    user=User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticated?(:password, params[:session][:password])
        if user.activated?
          log_in user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          reindirizza(user)
        else
          errore="User non ancora attivato, controlla la tua casella mail"
          flash[:warning]=errore
          redirect_to root_url
        end
    else
        flash.now[:danger]= "Errore, user non esistente o password sbagliata, riprova il login perfavore"
        render 'new'
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
