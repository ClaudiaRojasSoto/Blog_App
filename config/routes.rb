Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  root 'users#index'
  # resources :posts do
  #   resources :comments
  # end

  namespace :api do
    namespace :v1 do
      resources :posts
      get 'posts/:post_id/comments/' , to: 'posts#comments_for_post'
      post 'posts/:post_id/comments/', to: 'posts#create_comment'
    end
  end

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
end
