class Hit < ActiveRecord::Base
  belongs_to :shorten_url, counter_cache: true
end
