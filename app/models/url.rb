class Url < ActiveRecord::Base
  has_many :shorten_urls

  validates :url, presence: true
end
