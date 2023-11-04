class User < ApplicationRecord
  # validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]
  has_many :authorizations, dependent: :destroy

  has_one_attached :image


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.full_name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.date_of_birth = "1998-01-21"
      user.telephone = "08000001111"
      user.save!
    end
  end

  after_create :send_welcome_mail

  def send_welcome_mail
    UserNoticeMailer.send_signup_email(self).deliver_now
  end

end
