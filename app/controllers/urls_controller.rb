class UrlsController < ApplicationController
  def index
    @urls = Url.includes(:shorten_url).order(hit_count: :desc).limit(50)
  end

  def create
    @url = Url.where(url: params[:url]).first_or_create
    @url.shorten_url.create( uniq_id: @url.shorten, expired_at: Time.now.utc + 1.year )
  end

  def show
    shorten_url = ShortenUrl.find(params[:id])
    shorten_url.url.update_column(:hit_count, shorten_url.url.hit_count.next)
    redirect_to shorten_url.url.url
  end
end
