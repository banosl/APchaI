class Api::V1::SubscriptionsController < ApplicationController
  def create
    customer = Customer.find_by(id: params[:customer_id])
    tea = Tea.find_by(title: params[:tea_name])
    subscription = customer.subscriptions.new(subscription_params)
    subscription[:tea_id] = tea.id

    if subscription.save
      render json: SubscriptionSerializer.format_subscription(subscription), status: 201
    end
  end

  private
  def subscription_params
    params.permit(:title, :price, :status, :frequency)
  end
end