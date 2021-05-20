Rails.application.routes.draw do
  namespace :api do
    resources :phones, except: :edit
  end
 
end
