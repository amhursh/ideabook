Rails.application.routes.draw do

  root "welcome#index"

  resources :users, only: [:new, :create, :show] do
  	resources :ideas
  end

  get '/login', to: "sessions#new"

  post '/login', to: "sessions#create"

  delete '/logout', to: "sessions#destroy"

  namespace :admin do
  	resources :categories, only: [:index, :new, :create, :destroy]
    resources :images, only: [:new]
  end

end
