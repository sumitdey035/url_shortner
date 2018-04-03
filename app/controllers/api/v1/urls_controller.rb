module Api::V1
  class UrlsController < ApplicationController
    before_action :doorkeeper_authorize!

    def create
      @url = Url.where(url: params[:longUrl]).first_or_create
      render json: { shorlUrl: @url.generate_short_url(request.base_url) }
    end

    private

    def current_resource_owner
      # find logged in user (via devise) if doorkeeper token
      Account.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
  end
end
