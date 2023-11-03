class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]
  has_many :authorizations, dependent: :destroy

  has_one_attached :image

  def self.from_omniauth(auth)
    authorization = User.find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    authorization.assign_attributes(full_name: auth.info.name, email: auth.info.email)

    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.full_name = auth.info.name
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
