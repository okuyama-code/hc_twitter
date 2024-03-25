# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def send_notification_email(email)
    Rails.logger.debug 'メール送信'
    @email = email
    Rails.logger.debug @email
    mail to: @email, subject: '通知があります'
  end
end
