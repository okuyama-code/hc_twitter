# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:room_id])
    message = room.messages.build(message_params)
    message.user_id = current_user.id
    if message.save!
      flash[:notice] = 'メッセージを投稿しました。'
      redirect_to request.referer
    else
      flash[:notice] = 'メッセージの投稿に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
