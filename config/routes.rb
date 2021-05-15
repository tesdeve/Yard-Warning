Rails.application.routes.draw do

  root "marshall_warnings#index"  
  resources :marshall_warnings do 
    collection do 
      get 'history', to: 'marshall_warnings#history'
    end    
  end

  devise_for :users
  get 'search', to: 'marshall_warnings#search'

  

  #root 'pages#home'  

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
