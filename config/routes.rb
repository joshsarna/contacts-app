Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/contacts/:id' => 'contacts#show'
    get '/contacts' => 'contacts#index'
    delete '/contacts/:id' => 'contacts#destroy'
    post '/contacts' => 'contacts#create'
    patch '/contacts/:id' => 'contacts#update'

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
  end
end