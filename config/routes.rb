Rails.application.routes.draw do
  root "sessions#new"
  get "/signup" => "users#new"
  get "/login"  => "sessions#new"
  delete "/logout" => "sessions#destroy"

  resources :sessions, only: [:create]
  resources :users
  resources :ideas do
    resources :comments, only: [:create]
    # TODO: refactor these routes, they read ugly
    resources :idea_members, only: [:create, :destroy]
  end
end
