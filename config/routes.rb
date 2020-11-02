Rails.application.routes.draw do
  root "articles#index"
  resource :session, only: [:new, :create, :destroy]
  resources :articles do
    resources :comments, only: [:index, :new, :create]
  end
end
