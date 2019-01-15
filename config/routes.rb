Rails.application.routes.draw do
  get 'post_comments/new'
  get 'post_comments/edit'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  get 'home/top'
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
