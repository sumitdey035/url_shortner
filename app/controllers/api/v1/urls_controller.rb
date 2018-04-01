module Api::V1
  class UrlsController < ApplicationController
    def create
      @url = Url.where(url: params[:longUrl]).first_or_create
      @url.build_shorten_url.update( uniq_id: @url.shorten, expired_at: Time.now.utc + 1.year ) unless @url.shorten_url
      render json: { shorlUrl: @url.shorten_url.link(request.base_url) }
    end
  end
end
