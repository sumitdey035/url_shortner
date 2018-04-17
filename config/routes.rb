Rails.application.routes.draw do
  use_doorkeeper do
    controllers applications: 'oauth/applications'
  end

  get '/access_oauth_client_apps', to: 'doorkeeper_client_authorization_#access_oauth_client_apps'

  devise_for :accounts
  resources :urls, only: [:index, :create, :show]
  resources :shorten_urls, only: [:show]
  root 'pages#welcome'

  get '/:uniq_id' => 'shorten_urls#show'

  namespace :api do
    namespace :v1 do
      resources :urls, only: [:create]
    end
  end
end
