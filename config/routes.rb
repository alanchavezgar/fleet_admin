Rails.application.routes.draw do
  root 'home#index'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :vehicles
  resources :routes
  resources :cities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/vehicles/:id/send_to_route.json', to: 'vehicles#send_to_route'
  post '/vehicles/:id/finish_route.json', to: 'vehicles#finish_route'
end
