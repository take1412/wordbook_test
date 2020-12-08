Rails.application.routes.draw do
  devise_for :users
  root to: "wordlists#index"
<<<<<<< Updated upstream
  resources :wordlists, only: [:index, :new, :create, :show]
=======
  resources :wordlists do
    resources :words only: [:new, ]
  end
>>>>>>> Stashed changes
end
