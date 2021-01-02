Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  # resources :borrowers
  resources :lenders
  resources :borrowers do
    resources :loans
  end
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete 'session', to: 'session#destroy'

end
