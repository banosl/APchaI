class Api::V1::CustomersController < ApplicationController
  def create
    customer = Customer.new(customer_params)

    if customer.save
      render json: CustomerSerializer.format_new_customer(customer), status: 201
    elsif Customer.find_by(email: customer_params[:email])
      render json: {"errors": "Conflict, email already in use"}, status: 409 
    else
      render json: {"errors": customer.errors.full_messages.to_sentence}, status: 400
    end
  end

  def index
    customers = Customer.all
    render json: CustomerSerializer.format_all_customers(customers), status: 200
  end

  def show
    customer = Customer.find_by(id: params[:id])
    if Customer.find_by(id: params[:id])
      render json: {"data": CustomerSerializer.format_customer_subscriptions(customer)}, status: 200
    else
      render json: {"errors": "Customer does not exist"}, status: 404
    end
  end

  private
  def customer_params
    params.permit(:first_name, :last_name, :email, :address, :city, :state, :zipcode)
  end
end