Rails.application.routes.draw do
  
  #root 'pages#home'
  #devise_for :users  

  root "marshall_warnings#index"  
  resources :marshall_warnings 

  get 'search', to: 'marshall_warnings#search'

  #root "marshall_warnings#index"  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
