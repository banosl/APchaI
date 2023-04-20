require 'rails_helper'

RSpec.describe "POST customer subscription" do
  before :each do
    @customer1 = Customer.create(first_name: "Bob", last_name: "Wooper", email: "bwooper@gmail.com", address: "456 2nd St.", city: "Seattle", state: "WA", zipcode: 98002)
    @customer2 = Customer.create(first_name: "Madison", last_name: "Goldeen", email: "its_goldeen@gmail.com", address: "743 12th Ave", city: "Denver", state: "CO", zipcode: 80204)
    @customer3 = Customer.create(first_name: "Sandra", last_name: "Garcia", email: "garcia@gmail.com", address: "321 Maple St", city: "Denver", state: "CO", zipcode: 80211)
    @tea1 = Tea.create(title: "Hibiscus Tea", description: "Hibiscus tea is a herbal tea made as an infusion from crimson or deep magenta-colored calyces (sepals) of the roselle (Hibiscus sabdariffa) flower. It is consumed both hot and cold. It has a tart, cranberry-like flavor.", temperature: 200.0, brew_time: "3-5 Minutes")
  end

  describe 'creating a subscription for a customer' do
    it 'can create a subscription successfully' do
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/customers/#{@customer1.id}/subscriptions", headers: headers, params: JSON.generate({title: "Hibiscus Tea Subscription", 
                                                                                                        price: 15.00, 
                                                                                                        status: "active", 
                                                                                                        frequency: "Monthly", 
                                                                                                        tea_name: "Hibiscus Tea"})

      expect(response).to be_successful
      expect(response.status).to eq(201)

      package = JSON.parse(response.body, symbolize_names: true)

      expect(package).to have_key(:data)
      expect(package[:data]).to have_key(:relationships)
      expect(package[:data]).to have_key(:type)
      expect(package[:data]).to have_key(:attributes)
      expect(package[:data]).to have_key(:relationships)
      expect(package[:data][:attributes]).to have_key(:title)
      expect(package[:data][:relationships][:data]).to have_key(:attributes)
      expect(package[:data][:relationships][:data][:attributes]).to have_key(:description)

      expect(package[:data][:type]).to eq("subscription")
      expect(package[:data][:relationships][:data][:type]).to eq("tea")

    end

    it 'returns a message when the customer doesnt exist'

    it "returns an error message if the request is missing an attribute for a subscription"
  end
end