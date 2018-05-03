Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"

  get "show" => "user#show"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :questions, except: [:show, :new, :index]

  get '/questions/hashtag/:name', to: 'questions#hashtags'

  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'
end
