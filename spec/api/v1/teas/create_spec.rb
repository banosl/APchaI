require 'rails_helper'

RSpec.describe 'POST tea' do
  describe 'creating a tea' do
    it 'successfully creates a tea' do
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/teas", headers: headers, params: JSON.generate({title: "Hibiscus Tea",
                                                                  description: "Hibiscus tea is a herbal tea made as an infusion from crimson or deep magenta-colored calyces (sepals) of the roselle (Hibiscus sabdariffa) flower. It is consumed both hot and cold. It has a tart, cranberry-like flavor.",
                                                                  temperature: 200.0,
                                                                  brew_time: "3-5 Minutes"})

      expect(response).to be_successful
      expect(response.status).to eq(200)

      tea = JSON.parse(response.body, symbolize_names: true)

      expect(tea).to have_key(:data)
      expect(tea[:data]).to have_key(:type)
      expect(tea[:data]).to have_key(:id)
      expect(tea[:data]).to have_key(:attributes)
      expect(tea[:data][:attributes]).to have_key(:title)
      expect(tea[:data][:attributes]).to have_key(:description)
      expect(tea[:data][:attributes]).to have_key(:temperature)
      expect(tea[:data][:attributes]).to have_key(:brew_time)
    end

    it 'returns a message if any of the required attributes are missing'

  end
end