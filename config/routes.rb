Rails.application.routes.draw do
  get 'workbooks/index'
  devise_for :users
  root to: "workbooks#index"
  resources :workbooks, only: :index
end
