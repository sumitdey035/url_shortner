class ShortenUrlsController < ApplicationController
  skip_before_action :authenticate_account!

  def show
    shorten_url = ShortenUrl.find_by(uniq_id: params[:uniq_id])
    shorten_url.hits.build(ip_address: request.remote_ip).save
    redirect_to shorten_url.url.url
  end
end