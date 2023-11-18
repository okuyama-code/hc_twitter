class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, only: [:update]

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(3)
    @like_posts = @user.likes.order(created_at: :desc).page(params[:page]).per(3)
    @repost_posts = @user.reposts.order(created_at: :desc).page(params[:page]).per(3)
    @commnet_posts = @user.comments.order(created_at: :desc).page(params[:page]).per(3)
  end

  def edit
  end

  def update
    @user = current_user.update(user_params)
    flash[:notice] = 'プロフィール情報を編集しました。'
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :self_introduction, :location, :website, :icon, :header)
  end
end
