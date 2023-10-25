class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]
  has_many :authorizations, dependent: :destroy

  def self.from_omniauth(auth)
    authorization = User.find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    authorization.assign_attributes(full_name: auth.info.name, email: auth.info.email)

    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image if auth.info.image.present?
      user.password = Devise.friendly_token[0, 20]
      user.date_of_birth = "1998-01-21"
      user.telephone = "08000001111"
      user.save!

    end
  end

end
