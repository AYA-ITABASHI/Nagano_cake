Rails.application.routes.draw do

  namespace :admin do
    get 'customers/index'
    get 'customers/edit'
    get 'customers/show'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top' => 'admin/homes#top'
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

  get '/items' => 'public/items#index', as:'items'
  get '/items/:id' => 'public/items#show', as:'item'

  get 'customers/mypage' => 'public/customers#show', as:'mypage'
  get '/cart_items' => 'public/cart_items#index', as:'cart_items'


  #post 'orders/confirm' => 'public/orders#confirm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
