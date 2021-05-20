Rails.application.routes.draw do
  namespace :api do
    resources :phones, except: :edit
    resources :macbooks, except: :edit
    resources :ipads, except: :edit
  end
 
end
