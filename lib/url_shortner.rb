# This module contains all the method related to Url shortning
module UrlShortner
  # Returns 6 digit 32 base numbering encoded string of the object ID
  def encode
    id.to_s(36).to_s.rjust(6, '0')
  end
end