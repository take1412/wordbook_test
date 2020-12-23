Rails.application.routes.draw do
  devise_for :users
  root to: "wordlists#index"
  resources :wordlists do
    resources :words, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :authorities, only: [:index, :new, :create, :destroy]
    get "wordsrand" , to: "words#rand"
    collection do
      get 'search'
    end
    resource :favorites, only: [:create, :destroy]
  end
  get "favorite" , to: "favorites#index"
  resources :users, only: :show
end
