class ShortenUrl < ActiveRecord::Base
  belongs_to :url

  validates :url_id, :uniq_id, :expired_at, presence: true

  def link(domain)
    "#{domain}/#{uniq_id}"
  end
end
