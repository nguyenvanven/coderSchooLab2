Rails.application.routes.draw do
  get 'friendships/index'

  get 'friendships/create'

  get 'friendships/destroy'

  root 'users#index'
  get 'messages/index'
  get 'login' =>'sessions#new'
  post 'login_submit' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :users

  resources :messages
  get 'messages/view_sent_messages'

  resources :friendships
  post "block_friendship" => "friendships#block"
  post "unblock_friendship" => "friendships#unblock"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
