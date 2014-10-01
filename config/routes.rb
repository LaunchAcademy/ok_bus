Rails.application.routes.draw do
  devise_for :users
  root to: 'buses#index'

  namespace :admin do
    resources :users, only: [:index, :destroy] do
      get '/page/:page', action: :index, on: :collection
    end
  end

  resources :buses, only: [:index, :show] do
<<<<<<< HEAD
    resources :reviews, only: [:new, :create, :edit] do
      get '/page/:page', action: :index, on: :collection
=======
    resources :reviews, only: [:new, :create, :edit, :update] do
      resources :votes, only: [:create, :update]
>>>>>>> 0f2e3170fbe13f3927545509b1ba7fb2e7d717da
    end
  end

  resources :reviews, only: [:update, :destroy] do
    resources :votes, only: [:destroy]
  end

  resources :users, only: :show

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
