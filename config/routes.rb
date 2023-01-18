Rails.application.routes.draw do
  resources :tasks
  resources :projects
  resources :employees
  resources :companies do
    collection { post :import }
    member { get :download }
   end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "companies#index"
end
