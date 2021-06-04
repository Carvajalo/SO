Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  #root 'conversations#index'
  #get '/tweets', to: 'tweets#index'
  resources :tweets
  resources :relationships, only: [:create, :destroy]
  get 'followers', to: 'relationships#followers'
  get 'following', to: 'relationships#show'

  resources :conversations do
    resources :messages
  end


  namespace :api do
    namespace :v1 do
      resources :tweets, only: [:index, :show, :create, :destroy]
      #resources :relationships, only: [:destroy]
      #post 'relation',to: 'relationships#destroy'
      post 'sign_up', to: 'users#create'
      post 'sign_in', to: 'users#login'
      post 'relationship', to: 'relationships#create'
      get 'follower', to: 'relationships#follower'
      get 'following', to: 'relationships#following'
      get 'tweets_list', to: 'relationships#tweets_list'
      get 'hashtag', to: 'tweets#src_hashtag'
      resources :conversations,  only: [:index, :create]
      #resources :messages,  only: [:index, :show, :create]
      

      get 'conversations/messages', to: 'messages#index'
      get 'conversations/message', to: 'messages#show'
      post 'conversations/newmsg', to: 'messages#create'
      # get 'conversations', to: 'conversations#index'
      # post 'conversation', to: 'conversations#create'
    end
  end




end
