Rails.application.routes.draw do
  resources :apps
  use_doorkeeper

  get '/access_oauth_client_apps', to: 'doorkeeper_client_authorization_#access_oauth_client_apps'

  devise_for :accounts
  resources :urls, only: [:index, :create, :show]
  root 'pages#welcome'

  get '/:id' => 'urls#show'

  namespace :api do
    namespace :v1 do
      resources :urls, only: [:create]
    end
  end
end
