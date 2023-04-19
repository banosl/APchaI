class CustomerSerializer
  def self.format_new_customer(customer)
    {
      "data": {
        "type": "customer",
        "id": customer[:id],
        "attributes": {
          "first_name": customer[:first_name],
          "last_name": customer[:last_name],
          "email": customer[:email],
          "address": customer[:address],
          "city": customer[:city],
          "state": customer[:state],
          "zipcode": customer[:zipcode]
        }
      }
    }
  end

  def self.format_customers_subscriptions(customer)
    # binding.pry
    active = customer.subscriptions.each do |subscription|
      subscription[:data][:relationships][:active]
    end
    cancelled = customer.subscriptions.each do |subscription|
      subscription[:data][:relationships][:cancelled]
    end
    {
      "data": {
        "type": "customer",
        "id": customer[:id],
        "attributes": {
          "first_name": customer[:first_name],
          "last_name": customer[:last_name],
          "email": customer[:email],
          "address": customer[:address],
          "city": customer[:city],
          "state": customer[:state],
          "zipcode": customer[:zipcode]
        },
        "relationships": {
          "active": [
            active.each do |subscription|
              { 
                "data": {
                  "type": "subscription",
                  "id": subscription[:id],
                  "attributes": {
                    "title": subscription[:attributes][:title],
                    "price": subscription[:attributes][:price],
                    "status": subscription[:attributes][:status],
                    "frequency": subscription[:attributes][:status]
                  },
                  "relationships":
                    TeaSerializer.format_tea(subscription[:relationships])
                    # "data": {
                    #   "type": "tea",
                    #   "id": subscription[:relationships][:id],
                    #   "attributes": {
                    #     "title": subscription[:relationships][:attributes][:title],
                    #     "description": subscription[:relationships][:attributes][:description],
                    #     "temperature": "#{subscription[:relationships][:attributes][:temperature]} F",
                    #     "brew_time": subscription[:relationships][:attributes][:brew_time]
                    #     }
                    #   }
                  }
                }
            end
          ],
          "cancelled": [
            cancelled.each do |subscription|
              { 
                "data": {
                  "type": "subscription",
                  "id": subscription[:id],
                  "attributes": {
                    "title": subscription[:attributes][:title],
                    "price": subscription[:attributes][:price],
                    "status": subscription[:attributes][:status],
                    "frequency": subscription[:attributes][:status]
                  },
                  "relationships":
                    TeaSerializer.format_tea(subscription[:relationships])
                  }
                }
            end
          ]
        }
      }
    }
  end
end