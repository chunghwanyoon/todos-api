# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  # module the controller without affecting the URI
  scope module: :v2, constraints: ApliVersion.new('v2') do
    resources :todos, only: :index
  end
  
  # namespace the controllers without affecting the URI
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :todos do
      resources :items
    end
  end
  
  # add routing for authentication action
  post 'auth/login', to: 'authentication#authenticate'
  
  # add routing for signup action
  post 'signup', to: 'user#create'
  
end
