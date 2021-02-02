class MessagesController < ApplicationController
  def index
    @message=Message.new
    # 指定チャットルームのレコード情報
    @room=Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    # @room.messagesでルームに紐づいたメッセージ.new(引数)で保存
    @message = @room.messages.new(message_params)
    if @message.save
      # indexへ
      redirect_to room_messages_path(@room)
    else
      render :index
    end
    
    
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
