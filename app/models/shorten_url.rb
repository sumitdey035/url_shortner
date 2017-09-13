class ShortenUrl < ActiveRecord::Base
  belongs_to :url

  validates :url_id, :uniq_id, :expired_at, presence: true

  def link(base_url)
    "#{base_url}/#{uniq_id}"
  end
end
