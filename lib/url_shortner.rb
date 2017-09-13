module UrlShortner
  def encode
    self.id.to_s(36).to_s.rjust(6, '0')
  end
end