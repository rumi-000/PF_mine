Rails.application.routes.draw do
  
  root :to => "user/homes#top"
  get "about" => "user/homes#about", as: "about"
  get "choice" => "user/homes#choice", as: "choice"
  get "admin" => "admin/homes#top", as: "admin"
  
  #管理者側 カリキュラム通りに記載している。
  #app/views/admin/shared/_links.html.erbでコメントアウトしてる。
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  

  namespace :admin do
  resources :tags, only: [:index, :new, :create, :destsroy]
  resources :users, only: [:index, :show]
  end
  
  #ユーザー側 カリキュラム通りに記載している。
  #app/views/user/shared/_links.html.erbでコメントアウトしてる。
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }
  
  scope module: 'user' do
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :index, :edit, :update] do
   resource :favorites, only: [:create, :destroy]
   end
  end
  

end

