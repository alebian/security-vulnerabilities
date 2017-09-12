Rails.application.routes.draw do
  root to: 'home#index'

  get '/os_injection', to: 'home#os_injection'

  resources :posts, only: [:show, :index]

  namespace :v1, defaults: { format: 'json' } do
    resources :users, only: [:show]
  end
end
