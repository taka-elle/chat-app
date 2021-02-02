class Room < ApplicationRecord
  # １部屋は複数の中間テーブルをもっている（user情報）
  has_many :room_users
  # １部屋は複数のusersをもっている、throughオプションで中間テーブルだと認識
  has_many :users, through: :room_users

  validates :name, presence: true
end
