require 'rails_helper'

RSpec.describe 'GET Customer(s)' do
  before :each do
    customer1 = Customer.create(first_name: "Bob", last_name: "Wooper", email: "bwooper@gmail.com", address: "456 2nd St.", city: "Seattle", state: "WA", zipcode: 98002)
    customer2 = Customer.create(first_name: "Madison", last_name: "Goldeen", email: "its_goldeen@gmail.com", address: "743 12th Ave", city: "Denver", state: "CO", zipcode: 80204)
    customer3 = Customer.create(first_name: "Sandra", last_name: "Garcia", email: "garcia@gmail.com", address: "321 Maple St", city: "Denver", state: "CO", zipcode: 80211)
  end
  describe 'get all customers' do
    it 'returns all customers with their subscriptions' do
      get '/api/v1/customers'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      customers = JSON.parse(response.body, symbolize_names: true)

      expect(customers).to have_key(:data)
    end

  describe 'get customer by id' do
    it 'returns customer specified' do
      get "/api/v1/customers/#{customer1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(customer).to have_key(:data)
      expect(customer[:data]).to have_key()
    end
  end
end