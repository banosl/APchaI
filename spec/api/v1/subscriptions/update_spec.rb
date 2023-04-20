require "rails_helper"

RSpec.describe "PATCH subscription" do
  before :each do
    @customer1 = Customer.create(first_name: "Bob", last_name: "Wooper", email: "bwooper@gmail.com", address: "456 2nd St.", city: "Seattle", state: "WA", zipcode: 98002)
    @customer2 = Customer.create(first_name: "Madison", last_name: "Goldeen", email: "its_goldeen@gmail.com", address: "743 12th Ave", city: "Denver", state: "CO", zipcode: 80204)
    @customer3 = Customer.create(first_name: "Sandra", last_name: "Garcia", email: "garcia@gmail.com", address: "321 Maple St", city: "Denver", state: "CO", zipcode: 80211)
    @tea1 = Tea.create(title: "Hibiscus Tea", description: "Hibiscus tea is a herbal tea made as an infusion from crimson or deep magenta-colored calyces (sepals) of the roselle (Hibiscus sabdariffa) flower. It is consumed both hot and cold. It has a tart, cranberry-like flavor.", temperature: 200.0, brew_time: "3-5 Minutes")
    @subscription1 = @customer1.subscriptions.create(title: "Hibiscus Tea Subscription", price: 15.50, status: "active", frequency: "Once a month", tea_id: @tea1.id)
  end

  describe 'updates a subscriptions status' do
    it 'changes the subscription to cancelled' do
      headers = { "CONTENT_TYPE" => "application/json" }

      patch "/api/v1/customers/#{@customer1.id}/subscriptions/#{@subscription1.id}", headers: headers, params: JSON.generate(status: "cancelled")

      expect(response).to be_successful
      expect(response.status).to eq(200)

      package = JSON.parse(response.body, symbolize_names: true)

      expect(package[:data][:attributes][:status]).to eq("cancelled")
    end

    xit 'returns an error if status isnt either active or cancelled' do
      headers = { "CONTENT_TYPE" => "application/json" }

      patch "/api/v1/customers/#{@customer1.id}/subscriptions/#{@subscription1.id}", headers: headers, params: JSON.generate(status: "apple pie")

      expect(response).to_not be_successful
      expect(response.status).to eq(200)
    end
  end
end