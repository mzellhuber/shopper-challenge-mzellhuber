Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  resources :applicants, only: [:create, :update, :show, :new, :edit] do
    collection do
      get :elegibility
      post :check_elegibility, path: "certify"
      post :applySuccess
      get :show
      get :searchApplication
      get :search
      get :new
    end
  end
end