Rails.application.routes.draw do
resources :posts do
resources :comments
end
root to: "posts#index"
resources :sessions, only: [:new, :create, :destroy]
  match 'signin',   to: 'sessions#new',     via: 'get'
  match 'signout',  to: 'sessions#destroy', via: 'delete'
end
