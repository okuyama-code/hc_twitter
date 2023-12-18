class NotificationMailer < ApplicationMailer
  def send_notification_email(user)
    # 引数にlike
    Rails.logger.debug 'メール送信'
    @user = user
    mail to: @user.email, subject: '通知があります'
  end
end

# 通知を受け取った側のメールアドレスに送信すればいい？
# visited_idのuserのemailに送ればいい？？

# def send_notification_mail
#   NotificationMailer.send_notification_email(self).deliver_now
# end

# https://github.com/okuyama-code/rails_ec/blob/main/app/controllers/orders_controller.rb

# https://github.com/okuyama-code/rails_ec/blob/main/app/mailers/order_mailer.rb

# 通知機能についての役割
# https://qiita.com/nekojoker/items/80448944ec9aaae48d0a
