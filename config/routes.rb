Rails.application.routes.draw do
  
  get 'instagram_app/create'

  devise_for :users, controllers: { sessions: 'mysessions' }

  root to: "welcome#index"

  # facebook actions routes: 

  get '/auth/facebook/callback', to: 'facebook_app#create'

  get 'facebooklogin', to: 'facebook_app#new'

  get 'facebookfollowed', to: 'facebook_app#followed'

  get 'facebook-search', to: 'facebook_app#search'
  
  # instagram actions routes:

  get 'auth/instagram/callback', to: 'instagram_app#create'

  get 'instagramfollowed', to: 'instagram_app#followed'

  get 'instagramlogin', to: 'instagram_app#new'



  # twitter actions routes:

  get 'auth/twitter/callback', to: 'twitter_app#create'

  get 'twitterlogin', to: 'twitter_app#new'

  get 'twitterfollowed', to: 'twitter_app#followed'

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
