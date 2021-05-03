Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :items do
    resources :buy_manages, only: [:index, :create]
  end
  
end
 