ConvoStarter::Application.routes.draw do
  devise_for :users

  root to: "static#index"

  get 'connect/home' => 'connect#home', as: 'connect_home'

end
