class RelationshipsController < ApplicationController
  # ログインしていない人にはこのコントローラーは遷移してほしくない
  before_action :authenticate_user!

  def create
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referrer || root_path
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referrer || root_path
  end
end
