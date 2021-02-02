class RoomsController < ApplicationController
  def new
    # これに入れてねっていう空の変数を定義
    @room = Room.new
  end
end
