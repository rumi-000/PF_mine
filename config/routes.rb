Rails.application.routes.draw do
  
  root :to => "user/homes#top"
  
  get "about" => "user/homes#about", as: "about"
  get "choice" => "user/homes#choice", as: "choice"
  get "admin" => "admin/homes#top", as: "admin"
  get "search" => "user/searches", as: "search"
  
  #管理者側 カリキュラム通りに記載している。
  #app/views/admin/shared/_links.html.erbでコメントアウトしてる。
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  
  namespace :admin do
  resources :tags, only: [:index, :new, :edit, :update, :create, :destroy]
  resources :users, only: [:index, :show]
  end
  
  
  
  
  
  
  #ユーザー側 カリキュラム通りに記載している。
  #app/views/user/shared/_links.html.erbでコメントアウトしてる。
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

 scope module: 'user' do
  resources :users, only: [:show, :edit, :update] do
   
   # 退会機能のルーティング
   collection do
    #confirm_withdraw アクション：退会確認画面の表示
   get 'confirm_withdraw'
    #withdraw アクション：退会実行処理の実行s
   patch 'withdraw'
   end
   
   resources :lists, only: [:new, :create, :index, :show, :destroy]
    #リスト作成のコントローラを呼び出し
    post 'add_to_list', to: 'lists#add_to_list', as: 'add_to_list'
  end
  
 resources :posts, only: [:new, :create, :show, :index, :edit, :update, :destroy] do
  resource :favorites, only: [:create, :destroy]
 resources :post_comments, only: [:create, :destroy]
 resources :post_lists
 end
 

 end

end
