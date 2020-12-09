Rails.application.routes.draw do
  devise_for :users
  root to: "wordlists#index"
  resources :wordlists do
    resources :words, only: [:new, :show, :create]
  end
end
