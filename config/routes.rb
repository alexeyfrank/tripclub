Tripclub::Application.routes.draw do
  mount Rich::Engine => '/rich', :as => 'rich'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope module: :web do
    root to: "welcome#index"

    resources :posts, only: [:index, :show]
    resources :houses, only: [:index, :show] do
      scope module: :houses do
        resources :bookings, only: [:new, :create]
      end
    end
    resources :pages, only: [:show]
    resources :events, only: [:index, :show]
    resources :travel_categories, only: [:show]
    resources :travel_ideas, only: [:show]

    namespace :admin do
      resources :settings,    :only => [:update]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :events, only: [:index]
    end
  end

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
