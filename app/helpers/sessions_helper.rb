module SessionsHelper
  #Metodo ausiliario, usato per recuperare lo user_id dal database.
  def log_in(user)
    session[:user_id] = user.id
  end
  def currentuser
    if @current_user==nil
        @current_user=User.find_by(id: session[:user_id])
    else
        return @current_user
    end
  end
   def islogged
      !current_user.nil?
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
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
   end
  end
