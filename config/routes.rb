Tcproj::Application.routes.draw do
  
  
  get "cbo_community_memberships/create"

  get "cbo_community_memberships/destroy"

  get "communities/new"

  get "communities/show"

  get "communities/index"

  get "user_community_memberships/create"

  get "user_community_memberships/destroy"

  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/signup', :to => 'users#new'
  match '/nearby_cbos', :to => 'cboprofiles#nearby'
  match '/my_cbos', :to => 'cbos#my'
  get "sessions/new"

  get "categorizations/new"
    
  
  root :to => "sessions#new"
  
  resources :users do
    collection do
      get 'confirmpage'
      post 'confirm'
    end
  end
  
  resources :cbos do
    collection do
      get 'confirmpage'
      get 'my'
      post 'confirm'
    end
  end
  
  resources :cboprofiles do
    collection do
      get 'nearby'
    end
  end
  
  resources :communities do
    collection do
      get 'nearby'
      get 'my'
    end
  end
  
  resources :memberships do
    member do
      put 'confirm'
    end
  end
  
  
  
  resources :userprofiles
  resources :cboprofiles
  resources :cbos
  resources :categories
  resources :opportunities
  resources :participations
  resources :memberships
  resources :communities
  resources :user_community_memberships
  resources :cbo_community_memberships
    

  get "pages/home"

  get "pages/contact"
  
  get "pages/about"
  


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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
