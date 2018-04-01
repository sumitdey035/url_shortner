require 'rails_helper'

RSpec.describe Api::V1::UrlsController, type: :controller do
  describe 'POST #create' do
    it 'returns http success when record is created' do
      post :create, longUrl: 'https://www.facebook.com/'
      json = JSON.parse(response.body)
      expect(response.status).to eq 200
    end
  end
end