Rails.application.routes.draw do
  root 'users#index'

  #:constraints means that forgive to use dot in params
  get '/developer/:full_name', to: "users#show", :constraints => { :full_name => /[^\/]+/ }

  namespace :admin do
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

    resources :sessions
    resources :users
    namespace :user do
      resources :experiences
      resources :skills
      resources :sns
      resources :products
    end
  end

end
