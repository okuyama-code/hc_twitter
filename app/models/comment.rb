class Comment < ApplicationRecord
  belongs_to :user  #Comment.userでコメントの所有者を取得
  belongs_to :post  #Comment.postでそのコメントがされた投稿を取得
  has_one_attached :comment_img
  has_many :notifications, dependent: :destroy
end
