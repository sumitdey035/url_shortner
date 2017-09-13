class Url < ActiveRecord::Base
  include UrlShortner

  has_one :shorten_url

  validates :url, presence: true

  def shorten
    encode
  end
end
