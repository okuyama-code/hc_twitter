class UserNoticeMailer < ApplicationMailer
  def send_signup_email(user)
    @user = user
    mail to: @user.email, subject: "会員登録が完了しました。"
  end
end
