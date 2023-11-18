class RelationshipsController < ApplicationController
  # ログインしていない人にはこのコントローラーは遷移してほしくない
  before_action :authenticate_user!

  def create
  end

  def destroy
  end
end
