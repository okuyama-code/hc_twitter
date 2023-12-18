class NotificationMailer < ApplicationMailer
  def send_notification_email(user)
    @user = user
    mail to: @user.email, subject: '通知があります'
  end
end

# 通知を受け取った側のメールアドレスに送信すればいい？
# visited_idのuserのemailに送ればいい？？

# def send_notification_mail
#   NotificationMailer.send_notification_email(self).deliver_now
# end
