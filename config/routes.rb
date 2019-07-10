Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :personas
  resources :opponents

  root to: 'personas#new'
  get '/personas', to: 'personas#index', as: 'fighter'
end
