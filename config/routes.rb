Rails.application.routes.draw do
  resource :sitecontent
  resources :categories
  resources :comments
  devise_for :users
  root "pages#home"

  resources :books

  ## needhelp, i added :as => user, after "undefined method `user_path'" in accounts/form. So following this advise from SO:
  #The :as parameter tells the router what to name the route as (You can then add _path or _url to whatever the :as parameter is).
  #Also, any time you link directly to an ActiveRecord model (e.g. link_to user.email, user), it will try to turn user into user_path.
  # get '/accounts/', to: 'accounts#index'
  # patch '/accounts/edit/', to: 'accounts#update'

  resources :accounts, except: [ :create, :new ]

  namespace :admin do
    get '/' => 'admin#index'
    get 'signasuser/:id', to: 'admin#signasuser', as: 'signasuser'
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
