Rails.application.routes.draw do
  devise_for :users

  root 'users#index'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
  post '/users/:user_id/posts', to: 'posts#create', as: 'user_posts_create'

  get '/users/:user_id/posts/:post_id/comments/new', to: 'comments#new', as: 'new_user_post_comment'
  post '/users/:user_id/posts/:post_id/comments', to: 'comments#create', as: 'user_post_comments'

  post '/user/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'user_post_likes'

  get '/user/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/user/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
end
