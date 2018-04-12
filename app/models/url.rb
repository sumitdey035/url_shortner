class Url < ActiveRecord::Base
  include UrlShortner

  has_one :shorten_url, dependent: :destroy
  belongs_to :account

  validates :url, presence: true
  validates :url, format: URI::regexp(%w(http https))

  def set_default
    page = MetaInspector.new(url)
    assign_attributes(title: page.title, description: page.description, favicon_link: page.images.favicon, image_link: page.images.best)
  end

  # Encode the Url ID
  def shorten
    encode
  end

  # Generate new or return previously created shorten url
  def generate_short_url(base_url)
    build_shorten_url.update( uniq_id: shorten, expired_at: Time.now.utc + 1.year ) unless shorten_url
    shorten_url.link(base_url)
  end
end
