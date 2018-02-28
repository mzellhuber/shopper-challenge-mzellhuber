Rails.application.routes.draw do
  resources :applicants
  get 'home/index'

  root 'home#index'
end
