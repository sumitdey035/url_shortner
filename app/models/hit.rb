class Hit < ActiveRecord::Base
  belongs_to :shorten_url, counter_cache: true
  # after_create :set_location_details TODO Later

  private
  def set_location_details
    location = Geocoder.search('204.57.220.1').first
    self.country_code = location.country_code
    # self.country_name = location.country_name
    # self.region_code = location.region_code
    # self.region_name = location.region_name
    self.city = location.city
    # self.zip_code = location.zip_code
    # self.time_zone = location.time_zone
    self.latitude = location.latitude
    self.longitude = location.longitude
    self.metro_code = location.metro_code
  end
end
