Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :collections do
    resources :books do
      member do
        get 'download', to: 'books#download'
        get 'read', to: 'books#read'
      end
    end
  end

  get 'translate', to: 'translations#translate'
end
