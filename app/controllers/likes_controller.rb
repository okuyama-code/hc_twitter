class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(post_id: params[:post_id])

    post = Post.find(params[:post_id])
    post.create_notification_like!(current_user)
    # TODO メールを送る記述
    post_user = post.user
    pp "デバック！！！！！！！！！！！！！"
    pp post_user
    pp post_user.email
    NotificationMailer.send_notification_email(post_user.email).deliver_now
    redirect_back fallback_location: root_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    redirect_back fallback_location: root_path
  end
end
