class NotificationMailer < ApplicationMailer
  def send_notification_email(user)
    @user = user
    mail to: @user.email, subject: '通知があります'
  end
end

# def send_notification_mail
#   NotificationMailer.send_notification_email(self).deliver_now
# end
