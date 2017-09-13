require 'rails_helper'

RSpec.describe Url, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:url) }
  end

  context 'associations' do
    it { is_expected.to have_one(:shorten_url) }
  end
end
