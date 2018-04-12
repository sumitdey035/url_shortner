class ShortenUrlsController < ApplicationController
  def show
    shorten_url = ShortenUrl.find_by(uniq_id: params[:uniq_id])
    if shorten_url
      shorten_url.url.update_column(:hit_count, shorten_url.url.hit_count.next)
      redirect_to shorten_url.url.url
    else
      redirect_to root_path
      flash[:notice] = 'The url dose not exist'
    end
  end
end
