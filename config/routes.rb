Rails.application.routes.draw do
  #resources :asxlistings
  root "users#new"
  resources :users
  resources :listings



  #resources :users,:confirmations, only: [:create, :delete ]  #We only want to create/delete email addresses
  
  # We also need to cover incorrect URLs enterred.  Any path that isn't captured above
  # will get picked up here and sent to root.
  get '*path' => 'users#new'

  
end
 