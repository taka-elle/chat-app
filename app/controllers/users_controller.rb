class UsersController < ApplicationController
  
  def edit
    
  end
  
  def update
    #保存できるか判定
    if current_user.update(user_params)
      #trueならroot_pathへリダイレクト
      redirect_to root_path 
    else
      #falseならそのままeditアクションに
      render :edit
    end
  end

  private

  def user_params #userのparamsをストロングパラメーターで引き抜く
    # paramsのモデルがuser[require(:user)]で許可するキーをedit.htmlの[:name]と[:email]からもってくる
    params.require(:user).permit(:name,:email)
  end
end
