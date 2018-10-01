module SessionsHelper
  #Metodo ausiliario, usato per recuperare lo user_id dal database.
  def log_in(user)
    session[:user_id] = user.id
  end
  def currentuser
    if @current_user==nil
        @current_user=User.find_by(id: session[:user_id])
    end
    else
        return @current_user
    end
   def islogged
      !current_user.nil?
   end
  end
