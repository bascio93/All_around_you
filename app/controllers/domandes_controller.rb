class DomandesController < ApplicationController
    before_action :logged_in_users,   only: [:create, :destroy]
    before_action :userdomanda, only: [:destroy, :edit]
    def create
       session[:has_voted]=false
       session[:like]=false
       session[:dislike]=false
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
       redirect_to root_url if domanda.nil?
       @servizio=domanda.servizi
       domanda.destroy
       flash[:success] = "Domanda eliminata"
       redirect_to @servizio
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
         if !session[:has_voted] && !session[:dislike]
            @domanda.increment!(:vote_count)
            @domanda.increment!(:likecount)
            session[:has_voted]=true
            session[:like]=true
            redirect_to @domanda
            return true
        end
        if !session[:has_voted] && session[:dislike]
            @domanda.increment!(:likecount)
            @domanda.decrement!(:nolikecount)
            session[:has_voted]=true
            session[:like]=true
            redirect_to @domanda
            return true
        end
        if session[:has_voted] && !session[:dislike]
            @domanda.decrement!(:vote_count)
            @domanda.decrement!(:likecount)
            session[:like]=false
            session[:has_voted]=false
            redirect_to @domanda
            return true
        end
        if  session[:has_voted] && session[:dislike]
            @domanda.increment!(:likecount)
            @domanda.decrement!(:nolikecount)
            session[:like]=true
            session[:has_voted]=true
            session[:dislike]=false
            redirect_to @domanda
            return true
        end
        redirect_to @domanda
    end
    def vote_down
        @domanda=Domande.find(params[:id])
         if !session[:has_voted] && !session[:like]
            @domanda.increment!(:vote_count)
            @domanda.increment!(:nolikecount)
            session[:has_voted]=true
            session[:dislike]=true
            redirect_to @domanda
            return true
        end
        if !session[:has_voted] && session[:like]
            @domanda.increment!(:likecount)
            @domanda.decrement!(:nolikecount)
            session[:has_voted]=true
            session[:dislike]=true
            redirect_to @domanda
            return true
        end
        if session[:has_voted] && !session[:like]
            @domanda.decrement!(:vote_count)
            @domanda.decrement!(:nolikecount)
            session[:dislike]=false
            session[:has_voted]=false
            redirect_to @domanda
            return true
        end
        if  session[:has_voted] && session[:like]
            @domanda.increment!(:nolikecount)
            @domanda.decrement!(:likecount)
            session[:dislike]=true
            session[:has_voted]=true
            session[:like]=false
            redirect_to @domanda
            return true
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
