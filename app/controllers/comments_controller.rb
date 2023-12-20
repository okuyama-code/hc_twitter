class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      @comment.post.create_notification_comment!(current_user, @comment.id)
      flash[:notice] = "コメントしました"

      post_user_email = @post.user.email
      pp "デバック！！！！！！！！！！！！！"
      pp post_user_email
      NotificationMailer.send_notification_email(post_user_email).deliver_now
      redirect_to request.referer
    else
      flash[:alert] = "コメントに失敗しました"
      redirect_to request.referer
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :comment_img)
    #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
