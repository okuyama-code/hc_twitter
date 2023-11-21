class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  # before_action :set_current_user, only: [:show, :create]

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(6)
    if current_user
      @following_posts = Post.where(user_id: current_user.followings.pluck(:id)).order(created_at: :desc).page(params[:page]).per(5)
    end
    if current_user
      @post = current_user.posts.new   #投稿一覧画面で新規投稿を行うので、formのパラメータ用にPostオブジェクトを取得
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments.order(created_at: :desc).page(params[:page]).per(3)
    @comment = current_user.comments.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(3)
    if @post.save
      redirect_to root_path
      flash[:notice] = "投稿しました"
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:post).permit(:post_content, :image)
  end
end
