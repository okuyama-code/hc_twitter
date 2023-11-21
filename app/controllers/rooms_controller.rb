class RoomsController < ApplicationController
  before_action :authenticate_user!
  def create
    room = Room.create
    current_entry = Entry.create!(user_id: current_user.id, room_id: room.id)
    another_entry = Entry.create!(user_id: params[:entry][:user_id], room_id: room.id)
    redirect_to room_path(room), notice: "roomのcreateアクションが実行されました。"
  end

  def index
    # ログインユーザー所属ルームID取得
    current_entries = current_user.entries
    my_room_id = []
    current_entries.each do |entry|
      #エントリーから取得したルームIDを my_room_id 配列に追加しています。
      my_room_id << entry.room.id
    end
    # 自分のroom_idと同じでuser_idが自分ではないentryを取得
    @another_entrys = Entry.where(room_id: my_room_id).where.not(user_id: current_user.id)
  end

  def show
  end
end
