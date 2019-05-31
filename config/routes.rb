Rails.application.routes.draw do
  get 'comments/new'
  get 'posts/new'
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
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
end
