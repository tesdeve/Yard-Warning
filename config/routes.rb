Rails.application.routes.draw do

  root "marshall_warnings#index"    
  resources :marshall_warnings 
  devise_for :users, :controllers => {:registrations => "registrations"} 
  
  get 'search', to: 'marshall_warnings#search'

  #root "marshall_warnings#index"  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'pages#home'
  #devise_for :users

end
