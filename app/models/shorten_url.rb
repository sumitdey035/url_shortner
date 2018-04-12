class ShortenUrl < ActiveRecord::Base
  belongs_to :url

  validates :url_id, :uniq_id, :expired_at, presence: true
  validates_uniqueness_of :uniq_id

  before_validation :assign_uniq_id

  # Returns the encoded link concatenated with project base url
  def link(base_url)
    "#{base_url}/#{uniq_id}"
  end

  private
  def assign_uniq_id
    self.uniq_id ||= url.shorten
    self.expired_at = Time.now.utc + 1.year
  end
end
