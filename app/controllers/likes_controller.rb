# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_find_post

  def create
    @like = current_user.likes.create(post_id: @post.id)

    @post.create_notification_like!(current_user)
    post_user_email = @post.user.email

    NotificationMailer.send_notification_email(post_user_email).deliver_now
    redirect_back fallback_location: root_path
  end

  def destroy
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    redirect_back fallback_location: root_path
  end
end

private

def set_find_post
  @post = Post.find(params[:post_id])
end
