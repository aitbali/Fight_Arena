Rails.application.routes.draw do
  get 'opponents/index'
  get 'opponents/show'
  get 'opponents/new'
  get 'opponents/create'
  get 'opponents/edit'
  get 'opponents/update'
  get 'opponents/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :personas

  root to: 'personas#new'
end
