require 'rubygems'
require 'httparty'
require 'json'
require 'date'

class DeliveryCenter
    include HTTParty
    base_uri "https://delivery-center-recruitment-ap.herokuapp.com/"
    file = File.read('payload.json')
    data_hash = JSON.parse(file)    

    if data_hash['payments'][0]['status'] == "paid"
        time = Time.now.strftime("%Hh%M - %d/%m/%Y")
        response = HTTParty.post(base_uri, body: {
            externalCode: data_hash['id'].to_s,
            storeId: data_hash['store_id'].to_i,
            subTotal: data_hash['total_amount'].to_s,
            deliveryFee: data_hash['total_shipping'].to_s,
            total_shipping: data_hash['total_shipping'].to_s,
            total: data_hash['total_amount_with_shipping'].to_s,
            country: data_hash['shipping']['receiver_address']['country']['id'].to_s,
            state: data_hash['shipping']['receiver_address']['state']['name'].to_s,
            city: data_hash['shipping']['receiver_address']['city']['name'].to_s,
            district: data_hash['shipping']['receiver_address']['neighborhood']['name'].to_s,
            street: data_hash['shipping']['receiver_address']['street_name'].to_s,
            # nao achei no payload um campo complement
            complement: 'galpao',
            latitude: data_hash['shipping']['receiver_address']['latitude'].to_f,
            longitude: data_hash['shipping']['receiver_address']['longitude'].to_f,
            dtOrderCreate: data_hash['date_created'].to_s,
            postalCode: data_hash['shipping']['receiver_address']['zip_code'].to_s,
            number: data_hash['shipping']['receiver_address']['street_number'].to_s,
            customer: {
                externalCode: data_hash['buyer']['id'].to_s,
                name: data_hash['buyer']['nickname'].to_s,
                email: data_hash['buyer']['email'].to_s,
                contact: data_hash['shipping']['receiver_address']['receiver_phone'].to_s,
            },
            items: [{
                # aqui tem que rolar um forech item
                externalCode: data_hash['order_items'][0]['item']['id'].to_s,
                name: data_hash['order_items'][0]['item']['title'].to_s,
                price: data_hash['order_items'][0]['unit_price'].to_f,
                quantity: data_hash['order_items'][0]['quantity'].to_i,
                total: data_hash['order_items'][0]['full_unit_price'].to_f,
                subItems: []
            }],
            payments: [{
                # aqui tem que rolar um forech item
                type: data_hash['payments'][0]['payment_type'].to_s,
                value: data_hash['payments'][0]['total_paid_amount'].to_f
            }]
        }.to_json)

        if response.code == 200
            p "salvando no banco de dados"
        end
    else
        p "pagamento não efetuado"
    end    
end


    