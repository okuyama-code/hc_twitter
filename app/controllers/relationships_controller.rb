# frozen_string_literal: true

class RelationshipsController < ApplicationController
  # ログインしていない人にはこのコントローラーは遷移してほしくない
  before_action :authenticate_user!

  def create
    @user = User.find_by(id: params[:user_id])
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    @user.create_notification_follow!(current_user)
    redirect_to request.referer, notice: 'フォローしました'
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referer, notice: 'フォローを解除しました'
  end
end
