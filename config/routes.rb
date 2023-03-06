Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "users#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # the user can see their challenges on their challenges page
  resources :challenges, only: [:index, :show ]
  get "/calendar", to: "user_challenges#index"
  # add tracker page
  get "/tracker", to: "user_challenges#tracker"

  resources :user_challenges, only: [:update]
  resources :user_answers, only: [:index]
  resources :questions, only: [:show] do
    resources :user_answers, only: [:create]
  end
  resources :challenges, only: [:index] do
    resources :user_challenges, only: [:create]
  end
end
