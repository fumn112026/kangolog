Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles, except: :index do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: :show

end
