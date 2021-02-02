class ApplicationController < ActionController::Base
  # ユーザーがログインしていなければログイン画面に遷移させる
  before_action :authenticate_user!
  # もし[devise]に関する[controller]の処理であればその時だけ[configure_permitted_parameters]メソッドを実行する
  # 新規登録のnew,createは[devise]の[controller]に記述されている
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  private
  def configure_permitted_parameters #許可されたパラメーターを構成
    #deviseのparamsのようなメソッド    permitで:devise処理名、許可するキーを選択
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  end
end
