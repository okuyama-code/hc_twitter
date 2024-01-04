# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      @comment.post.create_notification_comment!(current_user, @comment.id)
      flash[:notice] = 'コメントしました'

      post_user_email = @post.user.email
      
      NotificationMailer.send_notification_email(post_user_email).deliver_now
    else
      flash[:alert] = 'コメントに失敗しました'
    end
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :comment_img)
    # formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
