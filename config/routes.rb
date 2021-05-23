Rails.application.routes.draw do
  post "/api/login", to: "api/sessions#create"
  post "/api/signup", to: "api/users#create"
  delete "/api/logout", to: "api/sessions#destroy"
  get "/api/get_current_user", to: "api/sessions#get_current_user"
  namespace :api do
    resources :phones, except: :edit
    resources :macbooks, except: :edit
    resources :ipads, except: :edit
    resources :users, except: :edit
  end
 
end
