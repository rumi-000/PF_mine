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
  

  #ユーザー側 カリキュラム通りに記載している。
  #app/views/user/shared/_links.html.erbでコメントアウトしてる。
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }
  
  scope module: 'user' do
  resources :posts, only: [:new, :create, :show, :index, :edit, :update]
  #new,create,show
end
  

end


