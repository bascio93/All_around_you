class StaticPagesController < ApplicationController

  def home
    user=currentuser
    if !user.nil?
      @servizi = currentuser.servizis.build if logged_in?
      @serviziutente = currentuser.feed.paginate(page: params[:page])
    end
  end

  def help
  end


  def about
  end
end
