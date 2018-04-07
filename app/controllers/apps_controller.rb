class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  # GET /apps
  def index
    @apps = App.all
  end

  # GET /apps/1
  def show
    @apps = App.all
  end

  # GET /apps/new
  def new
    @apps = App.all
    @app = current_account.apps.new
  end

  # GET /apps/1/edit
  def edit
    @apps = App.all
  end

  # POST /apps
  def create
    @apps = App.all
    @app = current_account.apps.new(app_params)

    if @app.save
      redirect_to @app, notice: 'App was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /apps/1
  def update
    @apps = App.all
    if @app.update(app_params)
      redirect_to @app, notice: 'App was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /apps/1
  def destroy
    @apps = App.all
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
