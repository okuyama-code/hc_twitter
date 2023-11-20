class BookmarksController < ApplicationController

# TODO こことlink_toとmodelへ判別メソッドを作成
  def create
    @bookmark = current_user.bookmarks.create(post_id: params[:post_id])
    redirect_back fallback_location: root_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @bookmark = current_user.bookmarks.find_by(post_id: @post.id)
    @bookmark.destroy
    flash[:notice] = "ブックマークを解除しました"
    redirect_back fallback_location: root_path
  end
end
