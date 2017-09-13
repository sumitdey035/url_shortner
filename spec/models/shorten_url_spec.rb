require 'rails_helper'

RSpec.describe ShortenUrl, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:url_id) }
    it { is_expected.to validate_presence_of(:uniq_id) }
    it { is_expected.to validate_presence_of(:expired_at) }
    it { is_expected.to validate_uniqueness_of(:uniq_id) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:url) }
  end

  describe '#link' do
    let!(:url)         { create(:url) }

    it 'is expected to return the shorten url' do
      expect(url.shorten_url.link('http://localhost:3000')).to eq("http://localhost:3000/#{url.shorten_url.uniq_id}")
    end
  end
end
