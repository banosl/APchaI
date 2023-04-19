require 'rails_helper'

RSpec.describe 'show customer' do
  before :each do
    @customer1 = Customer.create(first_name: "Bob", last_name: "Wooper", email: "bwooper@gmail.com", address: "456 2nd St.", city: "Seattle", state: "WA", zipcode: 98002)
    @customer2 = Customer.create(first_name: "Madison", last_name: "Goldeen", email: "its_goldeen@gmail.com", address: "743 12th Ave", city: "Denver", state: "CO", zipcode: 80204)
    @customer3 = Customer.create(first_name: "Sandra", last_name: "Garcia", email: "garcia@gmail.com", address: "321 Maple St", city: "Denver", state: "CO", zipcode: 80211)
  end

  describe 'get customer by id' do
    it 'returns customer specified' do
      get "/api/v1/customers/#{@customer1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(customer).to have_key(:data)
      expect(customer[:data]).to have_key(:type)
      expect(customer[:data]).to have_key(:id)
      expect(customer[:data]).to have_key(:attributes)
      expect(customer[:data]).to have_key(:relationships)
      
      expect(customer[:data][:attributes]).to have_key(:first_name)
      expect(customer[:data][:attributes]).to have_key(:last_name)
      expect(customer[:data][:attributes]).to have_key(:email)
      expect(customer[:data][:attributes]).to have_key(:address)
      expect(customer[:data][:attributes]).to have_key(:city)
      expect(customer[:data][:attributes]).to have_key(:state)
      expect(customer[:data][:attributes]).to have_key(:zipcode)

      expect(customer[:data][:relationships]).to have_key(:active)
      expect(customer[:data][:relationships]).to have_key(:cancelled)
    end
  end
end