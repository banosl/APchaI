class Api::V1::TeasController < ApplicationController
  def create
    tea = Tea.new(tea_params)
    if tea.save
      render json: TeaSerializer.format_tea(tea), status: 201
    else
      render json: {"errors": tea.errors.full_messages.to_sentence}, status: 400
    end
  end

  private
  def tea_params
    params.permit(:title, :description, :temperature, :brew_time)
  end
end