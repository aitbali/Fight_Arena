Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :personas
  resources :opponents

  root to: 'personas#new'
  get '/personas', to: 'personas#index', as: 'fighter'

  get '/you_attaque_cool', to: 'personas#you_attaque_cool', as: 'attaque_cool'
  get '/you_attaque_medium', to: 'personas#you_attaque_medium', as: 'attaque_medium'
  get '/you_attaque_hard', to: 'personas#you_attaque_hard', as: 'attaque_hard'
  get '/ia_attaque_cool', to: 'opponents#ia_attaque_cool', as: 'receive_cool'
  get '/ia_attaque_medium', to: 'opponents#ia_attaque_medium', as: 'receive_medium'
  get '/ia_attaque_hard', to: 'opponents#ia_attaque_hard', as: 'receive_hard'
  get '/choose_action', to: 'opponents#choose_action', as: 'choose_action'
  get '/win', to: 'personas#win', as: 'win'
  get '/loose', to: 'personas#loose', as: 'loose'
end
