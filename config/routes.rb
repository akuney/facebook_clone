FacebookClone::Application.routes.draw do
  resources :users, :only => [:create, :new, :show] do
    resources :friendships, only: [:index]
    resources :statuses, only: [:index]
    resources :comments, only: [:index, :new]
    resources :profiles, only: [:show]
    resources :mutual_friends, only: [:index]
    resources :message_threads, only: [:new]

    resources :photos, only: [:index] do
      collection do
        get :tagged
      end
    end

  end

  resource :session, :only => [:create, :destroy, :new]

  resources :profiles, only: [:new, :edit, :create, :update]

  resources :pending_friendships, only: [:create, :destroy, :index]

  resources :friendships, only: [:create, :destroy, :index]

  resources :statuses, except: [:index] do
    resources :likes, only: [:create, :destroy, :index]
    resources :replies, only: [:create]
  end

  resources :comments, except: [:index, :new] do
    resources :likes, only: [:create, :destroy, :index]
    resources :replies, only: [:create]
  end

  resources :replies, only: [:update, :destroy, :edit] do
    resources :likes, only: [:create, :destroy, :index]
  end

  resources :message_threads, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end

  resources :photos, only: [:new, :create, :destroy, :show]


  resources :photo_comments, only: [:edit, :update] do
    resources :replies, only: [:create]
  end

  resources :search_results, only: [:index, :new]

  resources :photo_taggings, only: [:create, :destroy]

  root to: "session#new"

  resources :notifications, only: :index

  resources :demo_friends, only: :create

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
