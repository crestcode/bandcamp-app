Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  get 'tags/:tag', to: 'posts#index', as: :tag

  resource :search, only: [:show]
  resources :ratings, only: [:update]
  resources :posts, except: [:update] do
    resources :votes, only: [:create]
    resources :reviews, except: [:destroy]
  end
end