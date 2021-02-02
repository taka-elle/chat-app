Rails.application.routes.draw do
  # ユーザー機能に必要なルーティングを一気に生成してくれるdeviseのメソッド
  devise_for :users
  root to: "messages#index"
  # ７つのアクションのルーティングを一気に生成
  resources :users,only:[:edit,:update]
end
