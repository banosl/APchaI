require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'relationships' do
    it {should have_many :subscriptions}
  end

  describe 'validations' do
    it {should validate_presence_of :title, :description, :temperature, :brew_time}
  end
end