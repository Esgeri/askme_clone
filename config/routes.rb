Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"

  get "show" => "user#show"

  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :questions, except: [:show, :new, :index]

  get '/questions/hashtag/:name', to: 'questions#hashtags'
end
