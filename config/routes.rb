Rails.application.routes.draw do

  namespace :admin do
    resources :orders, only:[:show, :update]
  end

   namespace :admin do
    resources :order_details, only:[:update]
  end

  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update
    ]
   end

  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
  end

  namespace :admin do
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
  end
  namespace :admin do
    root to:'homes#top'
  end
  namespace :public do
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  end
  namespace :public do
    resources :orders, only:[:new, :index, :show, :create]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
  end

 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }

  root to:'public/homes#top'
  get '/about' => 'public/homes#about', as:'about'

  namespace :public do
   resources :items, only:[:index, :show]
  end

  namespace :public do
  get 'customers/mypage' => 'customers#show', as:'mypage'
  get 'customers/unsubscribe' => 'customers#unsubscribe', as:'unsubscribe'
  patch 'customers/withdrawal' => 'customers#withdrawal'
  resources :customers, only:[:edit, :update]
  end

  namespace :public do
  resources :cart_items, only:[:index, :update, :create]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  delete 'cart_items/:id' => 'cart_items#destroy'
  end


  #post 'orders/confirm' => 'public/orders#confirm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
