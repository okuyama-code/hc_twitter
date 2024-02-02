class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(3)
    @like_posts = @user.likes.order(created_at: :desc).page(params[:page]).per(3)
    @repost_posts = @user.reposts.order(created_at: :desc).page(params[:page]).per(3)
    @commnet_posts = @user.comments.order(created_at: :desc).page(params[:page]).per(3)

    # DM機能についての記述
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          #もし現在のユーザーと表示しているユーザーが同じルームにエントリーしていたら
          if current.room_id == another.room_id
            # @is_room は同じルームにエントリーがあるかどうかを示すフラグで、初期値は false
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      # @is_room が false の場合に中の処理を実行(同じルームにエントリーがない場合)
      unless @is_room
        @room = Room.new
        @entry = Entry.new
        #同じルームにエントリーがない場合に、新しいルームとエントリーが作成され、それを後続の処理で利用できるようになる。
      end
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
    @user = User.find_by(id: params[:id])
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
