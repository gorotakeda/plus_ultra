Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :reviews, only: [:index, :create]
    collection do
      get 'search'
    end
  end
end
