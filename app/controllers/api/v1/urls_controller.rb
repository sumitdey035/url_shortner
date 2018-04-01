module Api::V1
  class UrlsController < ApplicationController
    def create
      @url = Url.where(url: params[:longUrl]).first_or_create
      render json: { shorlUrl: @url.generate_short_url(request.base_url) }
    end
  end
end
