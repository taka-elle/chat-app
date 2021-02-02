class RoomsController < ApplicationController
  def new
    # これに入れてねっていう空の変数を定義
    @room = Room.new
  end

  def create
    # 空の変数
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
