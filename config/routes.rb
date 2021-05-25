Rails.application.routes.draw do
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'
  # get '/logged_in', to: 'sessions#is_logged_in?'
  namespace :api do
    resources :phones, except: :edit
    resources :macbooks, except: :edit
    resources :ipads, except: :edit
    # resources :users, except: :edit
  end
 
end
