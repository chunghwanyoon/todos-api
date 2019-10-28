# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  resources :todos do
    resources :items
  end

  # add routing for authentication action
  post 'auth/login', to: 'authentication#authenticate'
  
  # add routing for signup action
  post 'signup', to: 'user#create'
  
end
