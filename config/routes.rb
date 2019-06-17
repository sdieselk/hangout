Rails.application.routes.draw do
  get 'comments/new'
  get 'posts/new'
  get "posts/search" => "posts#search"
  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"
  get "pages/help"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :posts
  resources :comments

  get "users/:id/edit" => "users#edit"
  get "users/:id/edit_password" => "users#edit_password"

  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"

  get "comments/:id/edit" => "comments#edit"
  post "comments/:id/update" => "comments#update"
end
