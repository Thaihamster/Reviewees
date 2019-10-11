Rails.application.routes.draw do

  #いいね関係のルーティング
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  # レビュー関係のルーティング
  post "reviews/:post_id/create" => "reviews#create"
  get "reviews/:post_id/new" => "reviews#new"
  get "reviews/:post_id/:id/edit" => "reviews#edit"
  post "reviews/:post_id/:id/update" => "reviews#update"
  post "reviews/:post_id/:id/destroy" => "reviews#destroy"
  #ログイン・ログアウト関係のルーティング
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  # ユーザー関係のルーティング
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" =>"users#index"
  get "users/:id" => "users#show"
  get "users/:id/likes" => "users#likes"
  # 投稿関係のルーティング
  get "posts/index2" => "posts#index2"
  get "posts/new" => "posts#new"
  get "posts/:id" =>"posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  #トップページ、aboutページのルーティング
  get "/" => "home#index"
  get "about" => "home#about"

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
