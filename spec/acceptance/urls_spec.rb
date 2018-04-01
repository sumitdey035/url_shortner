require 'acceptance_helper'
# require 'rspec_api_documentation/dsl'

resource 'Urls' do

  post "api/v1/urls" do
    parameter :longUrl, 'Long Url', required: true

    let(:longUrl) { 'http://www.cricbuzz.coms' }

    example 'Listing orders' do
      do_request
      expect(status).to eq 200
      url = Url.find_by(url: params['longUrl'])
      expect(JSON.parse response_body).to eq({"shorlUrl"=>"http://example.org/#{url.shorten}"})
    end
  end
end