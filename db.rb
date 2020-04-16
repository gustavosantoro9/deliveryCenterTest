require 'pg'

class DB
    def initialize(body)
        $body = body
    end
    
    obj = JSON[$body]
    
    begin
        con = PG.connect :dbname => 'deliverycenter', :user => 'postgres'
        
        @query = "INSERT INTO register VALUES('#{obj['externalCode']}',#{obj['storeId']},'#{obj['subTotal']}','#{obj['deliveryFee']}','#{obj['total_shipping']}','#{obj['total']}','#{obj['country']}','#{obj['state']}','#{obj['city']}','#{obj['district']}', '#{obj['street']}','#{obj['complement']}',#{obj['latitude']},#{obj['longitude']},'#{obj['dtOrderCreate']}','#{obj['postalCode']}','#{obj['number']}','#{obj['customer']['externalCode']}','#{obj['customer']['name']}','#{obj['customer']['email']}','#{obj['customer']['contact']}','#{obj['items'][0]['externalCode']}','#{obj['items'][0]['name']}',#{obj['items'][0]['price']},'#{obj['items'][0]['quantity']}',#{obj['items'][0]['total']},'#{obj['payments'][0]['type']}',#{obj['payments'][0]['value']});"
        # p @query
        
        con.transaction do |con| 
            con.exec @query
            p "adicionado com sucesso ao banco de dados"
        end

    rescue PG::Error => e
        puts e.message 
    ensure
        con.close if con
    end
end