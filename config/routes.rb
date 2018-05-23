Rails.application.routes.draw do
  root 'home#index'
  #Deal with now resouce
  get "admin/products/search" => "admin/products#search", as: 'search_admin_product'
  get "admin/products/filter/:id" => "admin/products#filter", as: 'filter_admin_product'
  get "admin/orders" => "admin/orders#index", as: 'orders_admin'
  get "admin/orders/:id/modify" => "admin/orders#modify", as: 'orders_modify_admin'
  patch "admin/orders/:id/modify" => "admin/orders#update", as: 'orders_patch_admin'
  get "admin/orders/filter/:status" => "admin/orders#filter", as: 'orders_filter_admin'
  get "admin/orders/:id" => "admin/orders#show", as: 'orders_show_admin'
  get "contact" => "contact#show", as: 'contact_page'
  get "admin/contact" => "contact#show_admin", as: 'admin_show_contacts'

  get "admin/contact/:id/edit" => "contact#edit", as: 'admin_edit_contact'
  get "admin/contact/add" => "contact#add", as: 'admin_add_contact'
  post "admin/contact/add" => "contact#insert", as: 'add_post_contact_admin'
  patch "admin/contact/:id/edit" => "contact#update", as: 'edit_patch_contact_admin'
  
  namespace "admin" do
    resources :publishers #Okay
    resources :platforms # Okay
    resources :products #No search :(
    resources :users
    resources :userlevels 
    resources :provinces
  end
  
  #Let's do order! Final step
  get 'order' => 'order#index', as: 'place_order'
  post 'order' => 'order#create'
  get 'order/:id' => 'order#show', as: 'view_order'
  #Let's do products!!! Finally
  get "product/:id" => 'product#index', as: 'view_product'
  get "category/:id" => 'product#category', as: 'view_category'
  get "publisher/:id" => 'product#publisher', as: 'view_publisher'

  # Let's do cart?!
  get "cart" => "cart#show"
  get "cart/add/:id" => "cart#add", as: 'add_cart'
  get "cart/remove/:id" => "cart#remove", as: 'remove_cart'
  get "cart/clean" => "cart#clean", as: 'clean_cart'

  # Deal With Authentication
  post "sign_in" => "authentication#login"
  post "register" => "authentication#register"

  get "user" => "authentication#index", as: "userinfo"
  get "sign_in" => "authentication#sign_in"
  get "signed_out" => "authentication#signed_out"
  get "change_password" => "authentication#change_password"
  get "forgot_password" => "authentication#forgot_password"
  get "register" => "authentication#create_user"
  get "password_sent" => "authentication#password_sent"
  get "user/change_address" => "authentication#change_address", as: "change_address"
  patch "user/change_address" => "authentication#update_address", as: "update_address"
  #Search
  get "search/index" => "search#index"
  get "search/product" => "search#product", as: 'search_product'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
