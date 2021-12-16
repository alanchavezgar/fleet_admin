Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/swagger'
  mount Rswag::Api::Engine => '/swagger'
  resources :vehicles
  resources :routes
  resources :cities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
