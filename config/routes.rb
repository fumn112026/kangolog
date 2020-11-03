Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles, except: :index do
    resources :comments, only: [:create, :edit, :update, :destroy]
    collection do
      get 'search'
    end
  end

  resources :users, only: :show

end
