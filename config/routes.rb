Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  # resources :borrowers
  resources :lenders do
    resources :lender_loans
  end
  resources :borrowers do
    resources :loans
  end
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete 'session', to: 'session#destroy'


  # match '/auth/:provider/callback', to: 'session#create', via: [:get, :post]
  get '/auth/:provider/callback', to: 'session#create'

  # get '/auth/github/callback' => 'session#create'

end
