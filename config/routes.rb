Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  get 'home/about' => 'homes#about' , as: "about"
end