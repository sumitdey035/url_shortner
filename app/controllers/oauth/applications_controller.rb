# app/controllers/oauth/applications_controller.rb
class Oauth::ApplicationsController < Doorkeeper::ApplicationsController
  before_filter :authenticate_account! # use before_action instead if on Rails 5.1+
  layout 'application'

  def index
    @applications = current_account.oauth_applications
  end

  def new
    @application = current_account.oauth_applications.new
  end

  def show
    render layout: false
  end

  def edit
    render layout: false
  end

  # only needed if each application must have some owner
  def create
    @application = Doorkeeper::Application.new(application_params)
    @application.owner = current_account if Doorkeeper.configuration.confirm_application_owner?
    @application.save
    render layout: false
    # if @application.save
    #   flash[:notice] = I18n.t(:notice, :scope => [:doorkeeper, :flash, :applications, :create])
    #   redirect_to oauth_application_url(@application)
    # else
    #   render :new
    # end
  end

  def update
    @application.update(application_params)
    render layout: false
  end

  private

  def set_application
    @application = current_account.oauth_applications.find(params[:id])
  end

end