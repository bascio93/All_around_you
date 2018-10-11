class ServizisController < ApplicationController
    before_action :logged_in_users, only: [:create, :destroy]
    before_action :userservizio, only: :destroy
  def create
    @servizio = currentuser.servizis.build(servizi_params)
    if @servizio.save
      flash[:success] = "Servizio aggiunto"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  @servizio.destroy
  flash[:success] = "Cancellazione avvenuta con successo"
  end

  private
    #Strong parameters (Parametri forti), nel controller possibile soltanto accedere alle chiavi whitelistate descrizione, tipo, indirizzo e nome
    def servizi_params
      params.require(:servizi).permit(:descrizione, :tipo, :indirizzo, :nome, :immagini)
    end
    def userservizio
      @servizio = current_user.servizis.find_by(id: params[:id])
      redirect_to root_url if @servizio.nil?
    end
end
