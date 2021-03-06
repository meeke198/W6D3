Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resource :users
  get "/users", to: "users#index"
  get "/users/new", to: "users#new", as: "new_users"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"
  get "/users/:id/edit", to: "users#edit", as: "edit_users"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"
end
