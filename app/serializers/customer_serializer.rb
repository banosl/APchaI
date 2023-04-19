class CustomerSerializer
  def self.format_customer(customer)
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
end