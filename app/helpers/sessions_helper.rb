module SessionsHelper
  #Metodo ausiliario, usato per recuperare lo user_id dal database.
  def log_in(user)
    session[:user_id] = user.id
  end
  def currentuser
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  def logged_in?
    !currentuser.nil?
  end
   def islogged
      !current_user.nil?
   end
   def reindirizza(default)
       redirect_to(session[:urlchiesto] || default)
       session.delete(:urlchiesto)
   end
   def salvalocation
       if request.get?
       session[:urlchiesto]=request.url
       end
   end
   #Salva il token e lo user id criptato sul browser
   def remember(user)
      user.remember
      cookies.permanent.signed[:user_id]=user.id
      cookies.permanent[:remember_token]=user.remember_token
   end
   def forget(user)
      user.forget
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
   end
   def log_out
    #forget(current_user)
    session.delete(:user_id)
    @current_user = nil
   end
  end
