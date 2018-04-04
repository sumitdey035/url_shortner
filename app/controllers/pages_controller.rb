class PagesController < ApplicationController
  def welcome
    render template: 'pages/welcome'
  end

  # def show
  #   render template: "pages/#{params[:page]}"
  # end
end