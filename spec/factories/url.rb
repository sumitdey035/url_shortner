FactoryGirl.define do
  factory :url, class: Url do
    url         'google.com'
    hit_count   0

    after(:create) do |url|
      url.build_shorten_url.update(uniq_id: url.shorten, expired_at: Time.now.utc + 1.year)
    end
  end
end