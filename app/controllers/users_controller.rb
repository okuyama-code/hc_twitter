class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, only: [:update]

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(3)
    @like_posts = @user.likes.order(created_at: :desc).page(params[:page]).per(3)
    @repost_posts = @user.reposts.order(created_at: :desc).page(params[:page]).per(3)
    @commnet_posts = @user.comments.order(created_at: :desc).page(params[:page]).per(3)

    # DM機能についての記述
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
    end

    if @isRoom
    else
      @room = Room.new
      @entry = Entry.new
    end
  end

  def followings
    # フォローしている人の一覧
    user = User.find(params[:id])
    @users = user.followings
    @user = User.find_by(id: params[:id])
  end

  def followers
    # フォローされている人の一覧
    user = User.find(params[:id])
    @users = user.followers
    @user = User.find_by(id: params[:id])
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
