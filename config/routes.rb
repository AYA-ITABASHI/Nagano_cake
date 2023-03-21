Rails.application.routes.draw do

  namespace :admin do
    resources :orders, only:[:show, :update]
  end
  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update
    ]
   end

  namespace :admin do
    resources :genres, only:[:index, :create, :edit]
  end

  namespace :admin do
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
  end
  namespace :admin do
    root to:'homes#top'
  end
  namespace :public do
    get 'adress/index'
    get 'adress/edit'
    get 'adress/create'
    get 'adress/update'
    get 'adress/destroy'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'

    get 'orders/complete'
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
  resources :customers, only:[:edit, :update, :unsubscribe, :withdrawal]
  end

  namespace :public do
  resources :cart_items, only:[:index, :update, :create, :destroy, :destroy_all]
  end


  #post 'orders/confirm' => 'public/orders#confirm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
