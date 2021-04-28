Rails.application.routes.draw do
  devise_for :users
  root "marshall_warnings#index"
  resources :marshall_warnings 

  get 'search', to: 'marshall_warnings#search'  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
