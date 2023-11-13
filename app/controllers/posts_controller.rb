class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  # before_action :set_current_user, only: [:show, :create]

  def index
    @posts = Post.all.order(created_at: :desc)
    if current_user
      @post = current_user.posts.new   #投稿一覧画面で新規投稿を行うので、formのパラメータ用にPostオブジェクトを取得
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments
    @comment = current_user.comments.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
      flash[:notice] = "投稿しました"
    else
      redirect_back fallback_location: root_path
      flash[:alert] = @post.errors.full_messages
    end
  end

  private
  def post_params
    params.require(:post).permit(:post_content, :image)
  end
end
