Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  
  resources :articles, except: :index do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  
  root 'articles#index'

end
