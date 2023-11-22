class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    pp "デバック！！！！！！！！！！！！！"
    pp params
    @message = Message.new(message_params)
    @message.room_id = params[:room_id]
    @message.user_id = current_user.id
    if @message.save!
      flash[:notice] = "メッセージを投稿しました。"
      redirect_to request.referer
    else
      flash[:notice] = "メッセージの投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
