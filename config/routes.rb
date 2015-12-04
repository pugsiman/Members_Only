Rails.application.routes.draw do
  root 'posts#index'
  get 'login' =>      'sessions#new'
  post 'login' =>     'sessions#create'
  delete 'logout' =>  'sessions#destroy'
  get 'signup' =>     'users#new'

  resources :posts, only: [:new, :create, :index]

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
end
