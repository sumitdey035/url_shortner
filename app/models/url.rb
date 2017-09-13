class Url < ActiveRecord::Base
  include UrlShortner

  has_one :shorten_url

  validates :url, presence: true

  # Encode the Url ID
  def shorten
    encode
  end
end
