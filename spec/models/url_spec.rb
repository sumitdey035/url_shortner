require 'rails_helper'

RSpec.describe Url, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:url) }
  end

  context 'associations' do
    it { is_expected.to have_one(:shorten_url) }
  end

  describe '#shorten' do
    let(:url) { create :url }

    it 'is expected to return the shorten url offset' do
      expect(url.shorten).to eq url.encode
    end
  end

  describe '#generate_short_url' do
    let(:url) { create :url }
    let(:base_url) { 'http://localhost:3000' }

    it 'is expected to return the shorten url offset' do
      expect(url.generate_short_url(base_url)).to eq url.shorten_url.link(base_url)
    end
  end
end
