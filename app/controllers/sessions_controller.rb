class SessionsController < ApplicationController
  def new
  end
  def create
    user=User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    log_in(user)
    redirect_to user
    else
        flash.now[:danger]= "Errore, user non esistente o password sbagliata, riprova il login perfavore"
        render 'new'
    end
  end
  def destroy
  end
end
