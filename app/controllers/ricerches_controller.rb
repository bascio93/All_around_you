class RicerchesController < ApplicationController
    def create
        testonome=params[:ricerche][:testonome]
        testotipo=params[:ricerche][:testotipo]
    #serie di if e else if in cascata per capire in base a che parametri vuole cercare l'utente
    if testotipo!="" && testonome!=""   #tipo e nome digitati entrambi
        servizipertipo=Servizi.where("tipo=?",testotipo)
        @servizi=servizipertipo.where("nome=?",testonome)
    elsif testotipo=="" && testonome!="" #nome soltanto digitato
        @servizi=Servizi.where("nome=?",testonome)
    elsif testotipo!="" && testonome=="" #tipo soltanto digitato
        @servizi=Servizi.where("tipo=?", testotipo)
    else  #non è stato digitato nulla ne per tipo ne per nome, restituisce tutti i servizi
        @servizi=Servizi.all
    end
    end
    private
    def ricerche_params
     params.require(:ricerche).permit(:testonome, :testotipo)
  end
end
