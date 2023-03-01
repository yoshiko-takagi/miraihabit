Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "users#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # the user can see their challenges on their challenges page
  resources :challenges, only: [:index, :show ]
  get "/calendar", to: "user_challenges#index"
  resources :user_challenges, only: [:update]
  # the assessment can be updated for the results
  resources :user_answers, only: [:index]
  # the questions in the assessment can be seen and updated for results
  namespace :questions, only: [:show] do
    resources :user_answers, only: [:create]
  end
  resources :challenges, only: [:index] do
    resources :user_challenges, only: [:create]
  end
end
