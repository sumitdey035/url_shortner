Rails.application.routes.draw do
  resources :urls, only: [:index, :create, :show]
  root 'urls#index'

  get '/:id' => 'urls#show'
end
