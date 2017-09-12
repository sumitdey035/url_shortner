class ShortenUrl < ActiveRecord::Base
  belongs_to :url_id

  validates :url_id, :uniq_id, :expired_at, presence: true
end
