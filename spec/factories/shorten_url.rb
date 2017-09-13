FactoryGirl.define do
  factory :shorten_url, class: ShortenUrl do
    hit_count   0
    url
  end
end