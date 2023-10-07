Rails.application.routes.draw do
  devise_for :users

  root 'users#index'
  # resources :posts do
  #   resources :comments
  # end

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'

  delete '/users/:user_id/posts/:id', to: 'posts#destroy', as: 'delete_user_post'

  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
  post '/users/:user_id/posts', to: 'posts#create', as: 'user_posts_create'

  delete '/users/:user_id/posts/:post_id/comments/:comment_id', to: 'comments#destroy', as: 'delete_user_post_comment'
  get '/users/:user_id/posts/:post_id/comments/new', to: 'comments#new', as: 'new_user_post_comment'
  post '/users/:user_id/posts/:post_id/comments', to: 'comments#create', as: 'user_post_comments'

  post '/user/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'user_post_likes'

  get '/user/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/user/:user_id/posts/:id', to: 'posts#show', as: 'user_post'

  namespace :api, defaults: { format: :json } do
    resources :sessions
    resources :posts, only: [:index] do
      resources :comments, only: [:index, :create]
    end
  end
end
