Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :questions do
    resources :answers
    resources :questions
    post '/check',to: 'questions#check_answers'
  end
  namespace :users do
    resources :users

    patch '/update_score',to: 'users#update_score'
    get '/get_cookie',to: 'users#get_cookie'
    post '/set_cookie',to: 'users#set_cookie'
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
