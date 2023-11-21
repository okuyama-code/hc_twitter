class RoomsController < ApplicationController
  before_action :authenticate_user!
  # users/showページで@is_roomがない時にformでパラメーターが送られてきてcreateアクションが走る。
  # 現在ログインしているユーザーとメッセージ相手のユーザーそれぞれの情報をroom_idで紐付けてEntryテーブルに２つレコードを作成している。
  def create
    room = Room.create(user_id: current_user.id)
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
    @room = Room.find(params[:id])
    @messages = @room.messages.all
    @message = Message.new
    @entries = @room.entries
    @another_entry = @entries.where.not(user_id: current_user.id).first
  end
end
