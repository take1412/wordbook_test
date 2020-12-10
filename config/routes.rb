Rails.application.routes.draw do
  devise_for :users
  root to: "wordlists#index"
  resources :wordlists do
    resources :words, only: [:index, :new, :show, :create]
  end
end
