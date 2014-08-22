Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :posts, :except => [:update] do
    resources :votes, only: [:create]
    resources :comments, only: [:index, :new, :create]
  end

end
