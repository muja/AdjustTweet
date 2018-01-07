Rails.application.routes.draw do
  resources :tweets, only: [:index] do
    post 'search', on: :collection
    get 'search', on: :collection, to: 'tweets#index'
  end
  root to: 'tweets#index'
end
