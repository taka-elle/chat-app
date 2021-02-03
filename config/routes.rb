Rails.application.routes.draw do
  # ユーザー機能に必要なルーティングを一気に生成してくれるdeviseのメソッド
  devise_for :users
  root to: "rooms#index"
  # ７つのアクションのルーティングを一気に生成
  # ユーザー情報と更新のアクション
  resources :users,only:[:edit,:update]
  # 部屋の作成と部屋情報を入れるアクション
  resources :rooms,only:[:new,:create,:destroy] do
    # どの部屋のメッセージか知りたいのでroomsの中にネストする
    # メッセージのやりとりページとメッセージ保存のアクション
    resources :messages,only:[:index,:create]
  end
end
