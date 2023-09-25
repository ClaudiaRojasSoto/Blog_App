Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/users', to: 'users#index'

  # root "articles#index"
  get '/users/:id', to: 'users#show', as: 'user'

  get '/user/:user_id/posts', to: 'posts#index', as: 'user_posts'

  get '/user/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
end
