Rails.application.routes.draw do

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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
