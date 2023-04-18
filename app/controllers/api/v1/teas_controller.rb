class Api::V1::TeasController < ApplicationController
  def create
    tea = Tea.new(tea_params)
    binding.pry
  end

  private
  def tea_params
    params.permit(:title, :description, :temperature, :brew_time)
  end
end