class MessagesController < ApplicationController
  def index
    @message=Message.new
    # 指定チャットルームのレコード情報
    @room=Room.find(params[:room_id])
    # @room.messagesでルームに紐づいている全てのメッセージ
    # モデル名.includes(:紐つくモデル名)で紐つくモデルを１度のアクセスで持ってこれる
    # N+1問題対策
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    # @room.messagesでルームに紐づいたメッセージ.new(引数)で保存
    @message = @room.messages.new(message_params)
    # もしsaveができたら？の条件式
    if @message.save
      # 成功でindexへ
      redirect_to room_messages_path(@room)
    else
      # 失敗したらrenderでindexへ
      # renderするときに@messagesを定義していないとエラーがおきる
      @messages = @room.messages.includes(:user)
      render :index
    end
    
    
  end

  

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
  
end
