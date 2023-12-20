# frozen_string_literal: true

class RepostsController < ApplicationController
  before_action :set_post

  def create
    if Repost.find_by(user_id: current_user.id, post_id: @post.id)
      redirect_to root_path, alert: 'すでにリポスト済みです'
    else
      @repost = Repost.create(user_id: current_user.id, post_id: @post.id)
      post = Post.find(params[:post_id])
      post.create_notification_repost!(current_user)

      post_user_email = post.user.email
      NotificationMailer.send_notification_email(post_user_email).deliver_now

      redirect_to request.referer, notice: 'リポストしました'
    end
  end

  def destroy
    @repost = current_user.reposts.find_by(post_id: @post.id)
    if @repost.present?
      @repost.destroy
      redirect_to request.referer, notice: 'リポストを取り消しました'
    else
      redirect_to root_path, alert: '既にリポストを取り消し済みです'
    end
  end

  private

  # リポストボタンを押した投稿を特定する
  def set_post
    @post = Post.find(params[:post_id])
    return unless @post.nil?

    redirect_to root_path, alert: '該当の投稿が見つかりません'
  end
end
