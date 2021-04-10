Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'

  get '/terms', to: 'pages#terms'
  get '/about', to: 'pages#about'

  resource :contacts, only: [:new, :create], path_names: { :new => ''}
  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
