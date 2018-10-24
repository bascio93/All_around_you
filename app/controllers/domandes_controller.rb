class DomandesController < ApplicationController
    before_action :logged_in_users,   only: [:create, :destroy]
    before_action :userdomanda, only: [:destroy, :edit]
    def create
       @servizio=Servizi.find_by(id: params[:domande][:servizio_id])
       @domande=Domande.new
       @domande.content=params[:domande][:content]
       @domande.servizi=@servizio
       @domande.user=currentuser
       @domande.vote_count=0
       @domande.likecount=0
       @domande.nolikecount=0
       if @domande.save
          flash[:success]= "Domanda inserita con successo"
          redirect_to @servizio
       else
          @feed_items = []
          render 'static_pages/home'
       end
    end
    def destroy
       domanda=Domande.find(params[:id])
       domanda.destroy
       flash[:success] = "Domanda eliminata"
       redirect_to request.referrer || root_url
    end
    #get domandes/:id
    def edit
      @domanda=Domande.find(params[:id])
    end
    #patch domandes/:id
    def update
       @domanda=Domande.find(params[:id])
       if @domanda.update_attributes(domande_params)
        flash[:success]="Domanda modificata"
        redirect_to @domanda.servizi
       else
        render 'edit'
      end
    end
    def show
        @domanda=Domande.find(params[:id])
        @risposte=Risposte.new
        @rispostes=@domanda.rispostes
    end
    def vote_up
        @domanda=Domande.find(params[:id])
         if !session[:has_voted].present?
            @domanda.increment!(:vote_count)
            @domanda.increment!(:likecount)
            session[:has_voted]=true
            redirect_to @domanda
            return true
         end
         if !session[:has_voted]
            @domanda.increment!(:vote_count)
            @domanda.increment!(:likecount)
            session[:has_voted]=true
         else
            @domanda.decrement!(:vote_count)
            @domanda.decrement!(:likecount)
            session[:has_voted]=false
        end
        redirect_to @domanda
    end
    def vote_down
        @domanda=Domande.find(params[:id])
        if  !session[:has_voted].present?
            @domanda.increment!(:vote_count)
            @domanda.increment!(:nolikecount)
            session[:has_voted]=true
            redirect_to @domanda
            return true
        end
         if !session[:has_voted]
            @domanda.increment!(:vote_count)
            @domanda.increment!(:nolikecount)
            session[:has_voted]=true
         else
            @domanda.decrement!(:vote_count)
            @domanda.decrement!(:nolikecount)
            session[:has_voted]=false
        end
        redirect_to @domanda
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
