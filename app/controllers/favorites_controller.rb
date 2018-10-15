class FavoritesController < ApplicationController
    def create
        @favorite=Favorite.new
        @servizio=Servizi.find_by(id: params[:id])
        cuser=currentuser
        @favorite.servizi=@servizio
        @favorite.user=currentuser
        if @favorite.save
            flash[:success] = "Preferito aggiunto"
            redirect_to preferiti_path(cuser.id)
         else
            flash[:danger] = "Preferito non aggiunto"
            render 'static_pages/home'
         end
    end

    def destroy
        favorite.destroy
        flash[:success] = "Preferito eliminato"
        redirect_to request.referrer || root_url
    end
end
