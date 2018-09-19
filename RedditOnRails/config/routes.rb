Rails.application.routes.draw do
  
  
  

  resources :users, only:[:new, :create]
  resource :session, only:[:new, :create, :destroy]
  resources :subs, except: [:destroy] do 
    resources :posts, only: [:new, :create]
  end 
  
  resources :posts, only:[:destroy, :edit, :update, :show] do
    resources :comments, only:[:create]
  end
  
  resources :comments, only:[:destroy]
  
  
end
