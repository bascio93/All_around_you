class RecensionisController < ApplicationController
    before_action :logged_in_users, only: [:create, :destroy]
    before_action :userrecensione, only: :destroy
     def create
         @servizio=Servizi.find_by(id: params[:recensioni][:servizi_id])
         @recensioni=Recensioni.new(recensioni_params)
         @recensioni.servizi=@servizio
         @recensioni.user=currentuser
         if @recensioni.save
            flash[:success] = "Recensione aggiunta"
            redirect_to @servizio
         else
            @feed_items = []
            render 'static_pages/home'
         end
     end
    def destroy
        recensioni.destroy
        flash[:success] = "Micropost deleted"
        redirect_to request.referrer || root_url
    end
    private
    def recensioni_params
        params.require(:recensioni).permit(:titolo, :content, :votoservizio, :servizi_id)
    end
    def userrecensione
      @recensione = currentuser.recensionis.find_by(id: params[:id])
      redirect_to root_url if @recensione.nil?
    end
end
