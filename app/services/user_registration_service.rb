# UserRegistrationsService: ユーザー登録サービス
class UserRegistrationService
  # self.callメソッド: ユーザー登録サービスの呼び出しメソッド
  def self.call(user)
    # ユーザーが既に保存済みの場合の処理
    if user.persisted?
      # UserMailerを使って新規ユーザーへのメールを非同期で送信
      UserMailer.new_user_email(user).deliver_later
    end
  end
end
