class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :post_id, :comment_img)
    #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
