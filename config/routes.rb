Rails.application.routes.draw do
  devise_for :admins
  resource :admin, only: [:show], controller: :admin
  resources :carts, only: [:create, :show, :destroy] do
    get "checkout", on: :member, to: "carts#checkout"
  end
  get "registrations/new"
  get "registrations/create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "new" => "products#new"

  get "/registro"=>"registrations#new", as: "registro"
    # post "/registro" => "registrations#create"

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    # get "up" => "rails/health#show", as: :rails_health_check
    # post 'products', to:'products#create'
    # get '/new', to: 'products#new', as: :new_product
    # get '/', to: 'products#index', as: :products
    # get '/:id', to: 'products#show', as: :product

    resources :products, path: "/"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
