Rails.application.routes.draw do
  devise_for :users
  root to: "wordlists#index"
  resources :wordlists do
    resources :words, only: [:index, :new, :show, :create]
    resources :authoritys, only: [:index, :new, :create, :destroy]
    get "wordsrand" , to: "words#rand"
    get "wordsrand/:id" , to: "words#next_page"
    collection do
      get 'search'
    end
    resources :favorites, only: [:create, :destroy]
  end
  get "favorite" , to: "favorites#index"
  resources :users, only: :show
end
