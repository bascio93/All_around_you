class RicerchesController < ApplicationController
    skip_before_action :verify_authenticity_token , only: :servizivicini
    # testare
    def create
        testoindirizzo=params[:ricerche][:testoindirizzo]
        testonome=params[:ricerche][:testonome]
        testotipo=params[:ricerche][:testotipo]
        #url1 = "https://maps.googleapis.com/maps/api/geocode/json?address="+testoindirizzo+"View,+CA&key=#{Rails.application.secrets.google_places_key}"
        #http_call1=open(url1).read
        #risposta1=JSON.parse(http_call1, {:symbolize_names => true})
        #lat=risposta1[:geometry][:location][:lat]
        #lng=risposta1[:geometry][:location][:lng]
        #url2 = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{risposta1[:results][:geometry][:location][:lat]},#{risposta1[:geometry][:location][:lng]}&radius=500&key=#{Rails.application.secrets.google_places_key}"
        #http_call2=open(url2).read
        #risposta2=JSON.parse(http_call, {:symbolize_names => true})
        if !testoindirizzo==""
            indparsato=testoindirizzo.split(',').first
            serviziperindirizzo=Servizi.near(indparsato, 50, units: :km )
            services=serviziperindirizzo
        else
            services=Servizi.all
        end
      #serie di if e else if in cascata per capire in base a che parametri vuole cercare l'utente
        if testotipo!="" && testonome!=""
           servizipertipo=services.where("tipo=?",testotipo)
           @servizi=servizipertipo.where("nome=?",testonome)
       elsif testotipo=="" && testonome!="" #nome soltanto digitato
          @servizi=services.where("nome=?", testonome)
       elsif testotipo!="" && testonome=="" #tipo soltanto digitato
          @servizi=services.where("tipo=?", testotipo)
       else  #non è stato digitato nulla ne per tipo ne per nome, restituisce tutti i servizi
          @servizi=services
       end
    end
    def servizivicini
        lat=params[:latitude]
        long=params[:longitude]
        @servizi=Servizi.near([lat, long], 5, units: :km)
    end
    private
    def ricerche_params
     params.require(:ricerche).permit(:testonome, :testotipo,:testoindirizzo)
    end
end
