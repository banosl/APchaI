require 'rails_helper'

RSpec.describe 'show customer' do
  before :each do
    @customer1 = Customer.create(first_name: "Bob", last_name: "Wooper", email: "bwooper@gmail.com", address: "456 2nd St.", city: "Seattle", state: "WA", zipcode: 98002)
    @customer2 = Customer.create(first_name: "Madison", last_name: "Goldeen", email: "its_goldeen@gmail.com", address: "743 12th Ave", city: "Denver", state: "CO", zipcode: 80204)
    @customer3 = Customer.create(first_name: "Sandra", last_name: "Garcia", email: "garcia@gmail.com", address: "321 Maple St", city: "Denver", state: "CO", zipcode: 80211)
    @tea1 = Tea.create(title: "Hibiscus Tea", description: "Hibiscus tea is a herbal tea made as an infusion from crimson or deep magenta-colored calyces (sepals) of the roselle (Hibiscus sabdariffa) flower. It is consumed both hot and cold. It has a tart, cranberry-like flavor.", temperature: 200.0, brew_time: "3-5 Minutes")
    @subscription1 = @customer1.subscriptions.create(title: "Hibiscus Tea Subscription", price: 15.50, status: "active", frequency: "Once a month", tea_id: @tea1.id)
  end

  describe 'get customer by id and shows subscriptions' do
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

      customer[:data][:relationships][:active].each do |sub|
        expect(sub).to have_key(:data)
        expect(sub[:data]).to have_key(:type)
        expect(sub[:data]).to have_key(:attributes)
        expect(sub[:data]).to have_key(:relationships)
        expect(sub[:data][:attributes]).to have_key(:title)
        expect(sub[:data][:attributes]).to have_key(:price)
        expect(sub[:data][:attributes]).to have_key(:status)
        expect(sub[:data][:attributes]).to have_key(:frequency)
        expect(sub[:data][:relationships]).to have_key(:data)
        expect(sub[:data][:relationships][:data]).to have_key(:type)
      end

      expect(customer[:data][:relationships][:cancelled]).to eq([])
    end

    it 'returns an error message if the customer is not found' do
      get "/api/v1/customers/5"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message[:errors]).to eq("Customer does not exist")
    end
  end
end