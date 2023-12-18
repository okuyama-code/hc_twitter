class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_uniqueness_of :post_id, scope: :user_id

  # def send_notification_mail
  #   NotificationMailer.send_notification_email(self).deliver_now
  # end
end
