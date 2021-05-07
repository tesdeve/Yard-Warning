Rails.application.routes.draw do

  root "marshall_warnings#index"  

  #root 'pages#home'  
  resources :marshall_warnings 
  devise_for :users
  get 'search', to: 'marshall_warnings#search'

  # devise_for :users, controllers: {
  #      sessions: 'users/sessions'
  #    }


  #devise_for :users, :controllers => {:registrations => "registrations"} 
  #devise_for :users, controllers: { sessions: 'users/sessions'}
  #devise_for :users, controllers: { sessions: 'users/sessions'}

  #devise_for :users
  
  #

  #root "marshall_warnings#index"  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'pages#home'
  #devise_for :users

end
