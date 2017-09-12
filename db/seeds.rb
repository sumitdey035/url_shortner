require 'csv'

CSV.foreach(Rails.root.to_s + "/db/data/urls.csv", headers: false) do |row|
  url = Url.where(url: row[0]).first_or_create( hit_count: rand(0..100) )
  url.build_shorten_url.update(uniq_id: url.shorten, expired_at: Time.now.utc + 1.year)
end