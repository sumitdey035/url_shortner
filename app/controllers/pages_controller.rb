class PagesController < ApplicationController
  skip_before_action :authenticate_account!

  def welcome
    account_signed_in? ? redirect_to(urls_path) : render(template: 'pages/welcome')
  end

  # def show
  #   render template: "pages/#{params[:page]}"
  # end
end