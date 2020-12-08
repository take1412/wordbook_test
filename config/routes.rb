Rails.application.routes.draw do
  devise_for :users
  root to: "wordlists#index"
  resources :wordlists, only: [:index, :new, :create, :show, :edit, :destroy]
end
