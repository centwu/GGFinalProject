Rails.application.routes.draw do
  get '/reports', to: "reports#index", as: 'reports'
  resources :orders
  devise_for :users
	resources :categories
  resources :menus
  get 'pages/home'
	post 'orders/change_status'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
