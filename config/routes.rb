Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'personas#index'

  resources :personas
  get    '/personas'          => 'personas#index'
  get    '/personas/new'      => 'apllication#hello'
  get    '/personas/:id'      => 'personas#show'
  post   '/personas'          => 'personas#create'
  get    '/personas/:id/edit' => 'personas#edit'
  patch  '/personas/:id'      => 'personas#update'
  put    '/personas/:id'      => 'personas#update'
  delete '/personas/:id'      => 'personas#destroy'
end
