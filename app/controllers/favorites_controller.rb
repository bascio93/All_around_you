class FavoritesController < ApplicationController
    def create
        @favorite=Favorite.new
        @servizio=Servizi.find_by(id: params[:id])
        cuser=currentuser
        if !((cuser.favorites.where("servizi_id=?", params[:id])).empty?)
            redirect_to @servizio
        else
          @favorite.servizi=@servizio
          @favorite.user=currentuser
          if @favorite.save
            flash[:success] = "Preferito aggiunto"
            redirect_to preferiti_path
         else
            flash[:danger] = "Preferito non aggiunto"
            render @servizio
         end
        end
    end

    def destroy
       preferito=Favorite.find(params[:id])
       preferito.destroy
       flash[:success] = "Servizio eliminato dai preferiti"
       redirect_to request.referrer || root_url
    end
end
