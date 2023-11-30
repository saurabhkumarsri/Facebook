Rails.application.routes.draw do
  devise_for :admins
  namespace :user do
    get 'login' => 'sessions#login', as: 'login'
    post "authentication"=>"sessions#login", as: "authentication"
    get "logout"=>"sessions#logout", as: "logout"
    get "users/index"

    #--------------------------------sessions-------------------------------#
    post 'create/sessions' => 'sessions#create', as: 'create'

    #--------------------------------User-------------------------------#
    post 'create/user' => 'users#post_create', as: 'post_create'


  end
end
