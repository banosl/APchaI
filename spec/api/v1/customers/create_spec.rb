require 'rails_helper'

RSpec.describe 'POST Customer' do
  describe 'creating a customer' do
    it 'succesfully creates a customer' do
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/customers", headers: headers, params: JSON.generate({first_name: "Leo",
                                                                    last_name: "Martinez",
                                                                    email: "leo@email.com",
                                                                    address: "123 1st St",
                                                                    city: "Denver",
                                                                    state: "Colorado",
                                                                    zipcode: 80204})

      expect(response).to be_successful
      expect(response.status).to eq(201)

      customer = JSON.parse(response.body, symbolize_names: true)
      
      expect(customer).to have_key(:data)
      expect(customer[:data]).to have_key(:type)
      expect(customer[:data]).to have_key(:id)
      expect(customer[:data]).to have_key(:attributes)
      expect(customer[:data][:attributes]).to have_key(:first_name)
      expect(customer[:data][:attributes]).to have_key(:last_name)
      expect(customer[:data][:attributes]).to have_key(:email)
      expect(customer[:data][:attributes]).to have_key(:address)
      expect(customer[:data][:attributes]).to have_key(:city)
      expect(customer[:data][:attributes]).to have_key(:state)
      expect(customer[:data][:attributes]).to have_key(:zipcode)

      expect(customer[:data][:attributes][:first_name]).to eq("Leo")
      expect(customer[:data][:attributes][:last_name]).to eq("Martinez")
      expect(customer[:data][:attributes][:email]).to eq("leo@email.com")
      expect(customer[:data][:attributes][:address]).to eq("123 1st St")
      expect(customer[:data][:attributes][:city]).to eq("Denver")
      expect(customer[:data][:attributes][:state]).to eq("Colorado")
      expect(customer[:data][:attributes][:zipcode]).to eq(80204)
    end

    it 'sends an error message when an attribute is missing' do
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/customers", headers: headers, params: JSON.generate({first_name: "Leo",
                                                                    last_name: "Martinez",
                                                                    address: "123 1st St",
                                                                    city: "Denver",
                                                                    state: "Colorado",
                                                                    zipcode: 80204})

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message[:errors]).to eq("Email can't be blank")
    end

    it 'sends an error message when the email is already in use' do
      customer1 = Customer.create({first_name: "Leo", last_name: "Jacobson", email: "leo@email.com", address: "124 1st St", city: "Denver", state: "Colorado", zipcode: 80204})
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/customers", headers: headers, params: JSON.generate({first_name: "Leo",
                                                                    last_name: "Martinez",
                                                                    email: "leo@email.com",
                                                                    address: "123 1st St",
                                                                    city: "Denver",
                                                                    state: "Colorado",
                                                                    zipcode: 80204})

      expect(response).to_not be_successful
      expect(response.status).to eq(409)

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message).to have_key(:errors)
      expect(message[:errors]).to eq("Conflict, email already in use")
    end
  end
end