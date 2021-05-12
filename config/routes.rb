Rails.application.routes.draw do
  namespace :api do
    resources :phones, except: :edit
    resources :descriptions, only: [:create, :show]
    resources :ratings, only: [:create, :show]
  end
 
end
