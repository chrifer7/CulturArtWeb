RailsApp::Application.routes.draw do
  namespace :content do
    resources :documents
  end


  namespace :content do
    resources :document_types
  end


  namespace :content do
    resources :attribute_values
  end


  namespace :content do
    resources :attributes
  end


  namespace :content do
    resources :overlayed_imgs
  end


  namespace :content do
    resources :heritages
  end
  
  get 'content/heritage_fields/frm_extra', to: 'content/heritages#form_extra_fields'
  post 'content/heritage_fields/save_extra', to: 'content/heritages#save_extra_fields'
  
  get 'content/heritages/find/:lat/:lon/:rad', to: 'content/heritages#find', 
      constraints: { lat: /[^\/]+/, lon: /[^\/]+/ }
  
  namespace :content do
    resources :attribute_types
  end


  namespace :content do
    resources :data_types
  end


  root :to => 'pages#index'
  
  get "pages/index"
  get "pages/about"
  get "pages/contact"
  get "pages/features"
  get "pages/login"
  get "pages/pricing"
  get "pages/register"
    
  resources :documents
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
  
  
  #match 'heritages' => 'heritages#save_extra_fields', :via => :post
  # match 'content/heritages/:id/save_extra_fields/:id' => 'content/heritages#save_extra_fields'#, :constraints => { :only_ajax => true }
  # match ':Content::HeritagesController/:save_extra_fields' => 'content/heritages#save_extra_fields'#, :constraints => { :only_ajax => true }
  
  
  
  
  
end
