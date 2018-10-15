class DomandesController < ApplicationController
    before_action :logged_in_users,   only: [:create, :destroy]
    before_action :userdomanda, only: [:destroy, :edit]
    def create
       @servizio=Servizi.find_by(id: params[:domande][:servizio_id])
       redirect_to signup_path if @servizio.id.nil?
       @domande=Domande.new
       @domande.content=params[:domande][:content]
       @domande.servizi=@servizio
       redirect_to signup_path if @domande.servizi.id.nil?
       @domande.user=currentuser
       redirect_to login_path if @domande.user.id.nil?
       if @domande.save
          flash[:success]= "Domanda inserita con successo"
          redirect_to @servizio
       else
          @feed_items = []
          render 'static_pages/home'
       end
    end
    def destroy
       domande.destroy
       flash[:success] = "Domanda eliminata"
       redirect_to request.referrer || root_url
    end
    #get domandes/:id
    def edit
      @domanda=Domande.find(params[:id])
    end
    #patch domandes/:id
    def update
       @domanda=Domanda.find(params[:id])
       if @domanda.update_attributes(domande_params)
        flash[:success]="Domanda modificata"
        redirect_to @domanda.servizi
       else
        render 'edit'
      end
    end
    private
    def domande_params
       params.require(:domande).permit(:content, :servizio_id)
    end
    def userdomanda
      @domanda = currentuser.domandes.find_by(id: params[:id])
      redirect_to root_url if @domanda.nil?
    end
    #aux method
    def nouserservizio(serv)
        if serv.user==currentuser
            flash[:danger] = "Domanda effettuata dall'utente creatore del servizio, errore"
            redirect_to serv
        end
    end
end
