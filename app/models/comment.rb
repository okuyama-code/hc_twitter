class Comment < ApplicationRecord
  belongs_to :user  #Comment.userでコメントの所有者を取得
  belongs_to :post  #Comment.postでそのコメントがされた投稿を取得
end
