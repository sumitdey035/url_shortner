class ShortenUrl < ActiveRecord::Base
  belongs_to :url

  validates :url_id, :uniq_id, :expired_at, presence: true
  validates_uniqueness_of :uniq_id

  # Returns the encoded link concatenated with project base url
  def link(base_url)
    "#{base_url}/#{uniq_id}"
  end
end
