class RispostesController < ApplicationController
    before_action :logged_in_users,   only: [:create, :destroy]
    before_action :userrisposta, only: [:destroy, :edit]
    #before_action :nouserdomanda, only: :create
    def create
       session[:has_voted_r]=false
       session[:like_r]=false
       session[:dislike_r]=false
       @domanda=Domande.find_by(id: params[:risposte][:domanda_id])
       @risposta=Risposte.new
       @risposta.content=params[:risposte][:content]
       @risposta.domande=@domanda
       @risposta.user=currentuser
       if @risposta.save
          flash[:success]= "risposta inserita con successo"
          redirect_to @risposta.domande
       else
          @feed_items = []
          render 'static_pages/home'
       end
    end
    def destroy
       risposta=Risposte.find(params[:id])
       risposta.destroy
       flash[:success] = "Risposta eliminata"
       redirect_to request.referrer || root_url
    end
    #get risposte/:id
    def edit
      @risposta=Risposte.find(params[:id])
    end
    def vote_up
        @risposta=Risposte.find(params[:id])
         if !session[:has_voted_r] && !session[:dislike_r]
            @risposta.increment!(:vote_count)
            @risposta.increment!(:likecount)
            session[:has_voted_r]=true
            session[:like_r]=true
            redirect_to @risposta.domande
            return true
        end
        if !session[:has_voted_r] && session[:dislike_r]
            @risposta.increment!(:likecount)
            @risposta.decrement!(:nolikecount)
            session[:has_voted_r]=true
            session[:like_r]=true
            redirect_to @risposta.domande
            return true
        end
        if session[:has_voted_r] && !session[:dislike_r]
            @risposta.decrement!(:vote_count)
            @risposta.decrement!(:likecount)
            session[:like_r]=false
            session[:has_voted_r]=false
            redirect_to @risposta.domande
            return true
        end
        if  session[:has_voted_r] && session[:dislike_r]
            @risposta.increment!(:likecount)
            @risposta.decrement!(:nolikecount)
            session[:like_r]=true
            session[:has_voted_r]=true
            session[:dislike_r]=false
            redirect_to @risposta.domande
            return true
        end
        redirect_to @risposta.domande
    end
    def vote_down
        @risposta=Risposte.find(params[:id])
         if !session[:has_voted_r] && !session[:like_r]
            @risposta.increment!(:vote_count)
            @risposta.increment!(:nolikecount)
            session[:has_voted_r]=true
            session[:dislike_r]=true
            redirect_to @risposta.domande
            return true
        end
        if !session[:has_voted_r] && session[:like_r]
            @risposta.increment!(:likecount)
            @risposta.decrement!(:nolikecount)
            session[:has_voted_r]=true
            session[:dislike_r]=true
            redirect_to @risposta.domande
            return true
        end
        if session[:has_voted_r] && !session[:like_r]
            @risposta.decrement!(:vote_count)
            @risposta.decrement!(:nolikecount)
            session[:dislike_r]=false
            session[:has_voted_r]=false
            redirect_to @risposta.domande
            return true
        end
        if  session[:has_voted_r] && session[:like_r]
            @risposta.increment!(:nolikecount)
            @risposta.decrement!(:likecount)
            session[:dislike_r]=true
            session[:has_voted_r]=true
            session[:like_r]=false
            redirect_to @risposta.domande
            return true
        end
        redirect_to @risposta.domande
    end
    #patch risposte/:id
    def update
       @risposta=Risposte.find(params[:id])
       if @risposta.update_attributes(risposte_params)
        flash[:success]="Risposta modificata"
        redirect_to @risposta.domande
       else
        render 'edit'
      end
    end
    private
    def risposte_params
       params.require(:domande).permit(:content, :domanda_id)
    end
    def userrisposta
      @risposta = currentuser.rispostes.find_by(id: params[:id])
      redirect_to root_url if @risposta.nil?
    end
    def nouserdomanda
        @domanda = currentuser.domandes.find_by(id: params[:domanda_id])
        @risposta = currentuser.rispostes.find_by(id: params[:id])
        redirect_to @risposta.domandes.servizi if @risposta.nil?
    end
    #aux method
    def nouserservizio(serv)
        if serv.user==currentuser
            flash[:danger] = "Domanda effettuata dall'utente creatore del servizio, errore"
            redirect_to serv
        end
    end
end
