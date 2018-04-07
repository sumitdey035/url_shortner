class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  # GET /apps
  def index
    @apps = App.all
  end

  # GET /apps/1
  def show
    render layout: false
  end

  # GET /apps/new
  def new
    @app = current_account.apps.new
  end

  # GET /apps/1/edit
  def edit
    render layout: false
  end

  # POST /apps
  def create
    @app = current_account.apps.new(app_params)
    @app.save
    render layout: false
  end

  # PATCH/PUT /apps/1
  def update
    @app.update(app_params)
    render layout: false
  end

  # DELETE /apps/1
  def destroy
    @app.destroy
    redirect_to apps_url, notice: 'App was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def app_params
      params.require(:app).permit(:name, :link, :description, :redirect_uri)
    end
end
