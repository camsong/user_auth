Auth3::Application.routes.draw do
  root :to => "users#new"

  match "/log_in" => "sessions#new", :as => "log_in"
  match "/sign_up" => "users#new", :as => "sign_up"
  match "/log_out" => "sessions#destroy", :as => "log_out"

  resources :sessions, :only => [:create]
  resources :users
  resources :password_resets

end
