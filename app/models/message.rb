class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image
  # unlessによりwas_attached?がfalseのときバリデーションを行う（unlessはifの逆）
  validates :content,presence: true,unless: :was_attached?

  def was_attached?
    # selfにはモデル名
    self.image.attached?
  end
end
