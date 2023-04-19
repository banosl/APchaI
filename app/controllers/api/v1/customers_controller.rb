class Api::V1::CustomersController < ApplicationController
  def create
    customer = Customer.new(customer_params)

    if customer.save
      render json: CustomerSerializer.format_customer(customer), status: 201
    end
  end

  private
  def customer_params
    params.permit(:first_name, :last_name, :email, :address, :city, :state, :zipcode)
  end
end