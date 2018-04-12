class UrlsController < ApplicationController
  def index
    @urls = Url.includes(:shorten_url).order(created_at: :desc)
  end

  def create
    @url = current_account.urls.find_or_initialize_by(url: url_params[:url])
    @url.shorten_url || @url.build_shorten_url
    @url.save
    render layout: false
  end

  def show
    @urls = Url.includes(:shorten_url).order(hit_count: :desc)
    @url = Url.find(params[:id])
    # if shorten_url
    #   shorten_url.url.update_column(:hit_count, shorten_url.url.hit_count.next)
    #   redirect_to shorten_url.url.url
    # else
    #   redirect_to root_path
    #   flash[:notice] = 'The url dose not exist'
    # end
    render layout: false
  end

  private
  # Only allow a trusted parameter "white list" through.
  def url_params
    params.require(:url).permit(:url)
  end
end
