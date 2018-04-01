require 'rails_helper'

RSpec.describe Api::V1::UrlsController, type: :controller do
  describe 'POST #create' do
    it 'returns http success when record is created' do
      post :urls

      json = JSON.parse(response.body)
      expect(response.status).to eq 200
    end
  end
end