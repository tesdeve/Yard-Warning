Rails.application.routes.draw do
  root "marshall_warnings#index"
  resources :marshall_warnings  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
