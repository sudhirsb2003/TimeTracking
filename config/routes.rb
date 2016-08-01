Rails.application.routes.draw do
  get 'home/index'
  resources :employees
  devise_for :users
  root to: "home#index"
  # resources :attendences
  # get '/record_attendence' => "home#login_time", as: :attendences
  get "/record_attendence" => "home#login_time", as: :log_time
  get "/analytics" => "analytics#index", as: :analytics

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

