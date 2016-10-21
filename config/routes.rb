Rails.application.routes.draw do
  root 'users#index'
  get 'messages/index'
  get 'login' =>'sessions#new'
  post 'login_submit' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :users

  resources :messages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
