class ApplicationController < ActionController::Base
    def show
    @user = User.find(params[:id])
    debugger
  end

  def new
  end
  protect_from_forgery with: :exception
  include SessionsHelper
end
