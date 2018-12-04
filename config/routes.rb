Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:username', to: 'users#find_user'

  resources :assets
  resources :cryptos
  resources :users

  scope "/auth", controller: :auth do
    post '/login' => :create
    get '/logout' => :destroy
    get '/current_user' => :show
  end
end
