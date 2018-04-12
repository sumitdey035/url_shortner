class UrlsController < ApplicationController
  def index
    @urls = Url.includes(:shorten_url).order(created_at: :desc)
  end

  def create
    @url = current_account.urls.find_or_initialize_by(url: url_params[:url])
    @url.shorten_url || @url.build_shorten_url
    @url.set_default if @url.valid?
    @url.save
    render layout: false
  end

  def show
    @url = Url.find(params[:id])
    render layout: false
  end

  private
  # Only allow a trusted parameter "white list" through.
  def url_params
    params.require(:url).permit(:url)
  end
end
