ConvoStarter::Application.routes.draw do
  devise_for :users

  root to: "static#index"

  get 'static/none_found' => 'static#none_found', as: 'static_none_found'

  get 'connect/home' => 'connect#home', as: 'connect_home'
  post 'connect/start_connect' => 'connect#start_connect', as: 'connect_start'

  get 'user/' => 'user_pages#show', as: 'user_pages'


end
