# frozen_string_literal: true

class User < ApplicationRecord
  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  has_one_attached :icon
  has_one_attached :header

  def self.from_omniauth(auth)
    # pp "デバック！！！！！！！！！！！！！"
    # pp auth.info
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.date_of_birth = '1995-01-01'
      user.telephone = '08000001111'
      user.username = auth.info.nickname
      user.icon.attach(io: File.open(Rails.root.join('app/assets/images/icon.png')), filename: 'icon.png')
      user.header.attach(io: File.open(Rails.root.join('app/assets/images/header.jpg')), filename: 'header.jpg')
    end
  end

  after_create :send_welcome_mail

  def send_welcome_mail
    UserNoticeMailer.send_signup_email(self).deliver_now
  end
end
