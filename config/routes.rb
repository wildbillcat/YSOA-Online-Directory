Students::Application.routes.draw do 
  
  match "submissions/ferpaupdate", :to => "submissions#ferpaupdate", :via => "post"

  resources :holidays  

  namespace :admin do
    resources :users
  end
    
  resources :products, :shallow => true do
    resources :transactions
  end
  
  resources :transactions, :only => [:index]

  resources :users do
    resources :equip_agreements
    resources :print_agreements
    resources :laser_agreements
  end
  
  resources :users, :shallow => true do
    resources :workstations
    resources :submissions
  end
  
  resources :users do
    collection do
      get :print_multiple
      post :edit_multiple
      put :update_multiple
    end
  end
  

  match "/users/print_multiple" => "users#print_multiple", :as => "print_multiple_users"
  match "/users/update_multiple" => "users#update_multiple", :as => "update_multiple_users"

  
  resources :workstations, :only => [:index]
  
  resources :submissions, :only => [:index]
  
  #resources :ferpa_agreement, :collection => { :agreement => :get, :update => :post } do
   # resources :users
    #resources :submissions
  #end
  
  match "/logout" => "application#logout",  :as => :logout

  match "/transactions/checkin/:id" => "transactions#checkin", :as => "product_checkin"

  match "/live_validations/validate_borrower_netid" => "live_validations#validate_borrower_netid", :as => "validate_borrower"
  
  match "/registration" => "registration#index", :as => :registration
  match "/register" => "registration#index", :as => :register
  match "/directory" => "directory#index", :as => :directory
  
  
  root :to => "directory#index"  

# { :controller => :live_validations, :action => :validate_borrower_netid }
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
