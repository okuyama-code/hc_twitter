class Post < ApplicationRecord
  validates :post_content, presence: true, length: { maximum: 140 }

  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy  #Post.commentsで、投稿が所有するコメントを取得できる。
  has_many :likes, dependent: :destroy
end
