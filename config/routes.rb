Rails.application.routes.draw do
  devise_for :users
  root to: "wordlists#index"
  resources :wordlists do
    resources :words, only: [:index, :new, :show, :create]
    get "wordsrand" , to: "words#rand"
    get "wordsrand/:id" , to: "words#next_page"
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
