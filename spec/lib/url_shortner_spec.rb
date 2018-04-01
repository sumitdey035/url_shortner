require 'rails_helper'

describe UrlShortner do
  let(:url) { create :url }

  describe '#encode' do
    it 'is expected to return the base 36 encoded value of the given url id' do
      expect(url.encode).to eq url.id.to_s(36).to_s.rjust(6, '0')
    end
  end
end