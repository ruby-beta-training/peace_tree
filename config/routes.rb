Rails.application.routes.draw do
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unprocessable_entity'
  get '/500', to: 'errors#internal_server_error'

  devise_for :users
  namespace :admin do
    root 'dashboard#index'
    resources :employees do
      member do
        put 'reset_password'
      end
    end
    resources :projects do
      resources :activities
      member do
        get 'delete_employee'
        get 'show_employees'
        get 'add_employee'
      end
    end
  end

  resources :employees

  root 'pages#home'
end
