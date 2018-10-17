class RicerchesController < ApplicationController
    def create
        testonome=params[:ricerche][:testonome]
        testotipo=params[:ricerche][:testotipo]
        testoindirizzo=params[:ricerche][:testoindirizzo]
    #serie di if e else if in cascata per capire in base a che parametri vuole cercare l'utente
    if testotipo!="" && testonome!=""  && testoindirizzo!="" #tipo e nome digitati entrambi
        servizipertipo=Servizi.where("tipo=?",testotipo)
        @servizi=servizipertipo.where("nome=?",testonome)
        @servizi2=servizipertipo.where("indirizzo=?",testoindirizzo)
    elsif testotipo=="" && testonome!="" && testoindirizzo!="" #nome soltanto digitato
        serviziperindirizzo=Servizi.where("indirizzo=?",testoindirizzo)
        @servizi=serviziperindirizzo.where("nome=?", testonome)
    elsif testotipo!="" && testonome=="" #tipo soltanto digitato
        @servizi=Servizi.where("tipo=?", testotipo)
    else  #non è stato digitato nulla ne per tipo ne per nome, restituisce tutti i servizi
        @servizi=Servizi.all
    end
    end
    private
    def ricerche_params
     params.require(:ricerche).permit(:testonome, :testotipo,:testoindirizzo)
  end
end
