class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  # １userは複数の中間テーブルを持っている
  has_many :room_users
  # １userは複数のroomsテーブルをもっている
  has_many :rooms, through: room_users
end
