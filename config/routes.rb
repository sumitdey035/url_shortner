Rails.application.routes.draw do
  resources :urls, only: [:index, :create, :show]
  root 'urls#index'

  get '/:id' => 'urls#show'

  namespace :api do
    namespace :v1 do
      resources :urls, only: [:create]
    end
  end
end
