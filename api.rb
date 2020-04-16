require 'rubygems'
require 'httparty'
require 'json'
require 'date'

require_relative 'model.rb'

class DeliveryCenter
    include HTTParty
    base_uri "https://delivery-center-recruitment-ap.herokuapp.com/" 
    model = Model.new
    
    if $paid == "paid"
        time = Time.now.strftime("%Hh%M - %d/%m/%Y")
        response = HTTParty.post(base_uri, body: $body)
        if response.code == 200
            p "salvando no banco de dados"
        end
    else
        p "pagamento não efetuado"
    end    
end


    