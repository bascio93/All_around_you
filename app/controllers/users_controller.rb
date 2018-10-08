class UsersController < ApplicationController
  before_action :logged_in_users, only: [:edit, :index, :update, :destroy]
  before_action :userincorretto, only: [:edit, :update]
  before_action :seiadmin, only: :destroy
  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(:page => params[:page], per_page: 15)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new

  end
  def userincorretto
    @user=User.find(params[:id])
    if @user!=currentuser
       reindirizza(@user)
    end
  end
  def seiadmin
    redirect_to(root_url) unless current_user.admin?
  end
  # GET /users/1/edit
  def edit
    @user=User.find(params[:id])
  end

  def logged_in_users
    if !logged_in?
        salvalocation
        flash[:danger]="Errore, utente non loggato"
        redirect_to login_url
    end
  end
  # POST /users
  # POST /users.json
    def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Clicca sull'email inviata al tuo indirizzo per confermare l'account"
      redirect_to root_url
    else
      msg=@user.errors.full_messages
      flash[:danger]=msg
      render 'new'
    end
  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  #modifica utente
  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
        flash[:success]="Profile updated"
        redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    def edit
        @user=User.find(params[:id])
    end
end
