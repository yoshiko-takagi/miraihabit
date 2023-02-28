Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "users#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :challenges, only: [:index ]
  get "/calendar", to: "user_challenges#calendar"
  resources :user_challenges, only: [:update]
  resources :user_answers, only: [:index]
  resources :questions, only: [:show] do
    resources :user_answers, only: [:create]
  end
  resources :challenges, only: [:index] do
    resources :user_challenges, only: [:create]
  end
end
