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
    active = []
    cancelled = []
    customer.subscriptions.each do |subscription|
      if subscription[:status] == "active"
        active << subscription
      elsif subscription[:status] == "cancelled"
        cancelled << subscription
      end
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
          "active":
            active.map do |subscription|
              { 
                "data": {
                  "type": "subscription",
                  "id": subscription[:id],
                  "attributes": {
                    "title": subscription[:title],
                    "price": subscription[:price],
                    "status": subscription[:status],
                    "frequency": subscription[:frequency]
                  },
                  "relationships":
                    TeaSerializer.format_tea(subscription.tea)
                  }
                }
            end,
          "cancelled":
            cancelled.map do |subscription|
              { 
                "data": {
                  "type": "subscription",
                  "id": subscription[:id],
                  "attributes": {
                    "title": subscription[:title],
                    "price": subscription[:price],
                    "status": subscription[:status],
                    "frequency": subscription[:frequency]
                  },
                  "relationships":
                    TeaSerializer.format_tea(subscription.tea)
                  }
                }
            end
        }
      }
    }
  end
end