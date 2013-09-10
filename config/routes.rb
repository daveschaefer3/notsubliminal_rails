NotsubliminalRails::Application.routes.draw do
  get "song_artist_relationships/create"
  get "song_artist_relationships/destroy"
  get "album_song_relationships/create"
  get "album_song_relationships/destroy"
  get "album_artist_relationships/create"
  get "album_artist_relationships/destroy"
  resources :users do
    collection do
      get :blogposts
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :blogposts, only: [:new, :show, :edit, :update, :create, :destroy]
  resources :songs, only: [:new, :show, :edit, :update, :create, :destroy]
  resources :albums, only: [:new, :show, :edit, :update, :create, :destroy]
  resources :artists, only: [:new, :show, :edit, :update, :create, :destroy]
  resources :song_artist_relationships, only: [:new, :create, :destroy]
  resources :album_artist_relationships, only: [:new, :create, :destroy]
  resources :album_song_relationships, only: [:new, :create, :destroy]

  root 'static_pages#home'
  # match '/users',   to: 'users#index',          via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/music',   to: 'static_pages#music',   via: 'get'
  match '/newblogpost', to: 'blogposts#new',    via: 'get'
  match '/blog',        to: 'blogposts#index',  via: 'get'
  match '/artists', to: 'artists#index',        via: 'get'
  match '/songs',   to: 'songs#index',          via: 'get'
  match '/albums',  to: 'albums#index',         via: 'get'
  get 'users/:id/blogposts', to: 'users#blogposts', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
